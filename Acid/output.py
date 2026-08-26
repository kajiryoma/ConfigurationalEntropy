#!/usr/bin/env python3

from pathlib import Path
import re

home = Path.cwd()
oup = home / "acid.dat"

T = 300.0
C = 4184.0  # J -> kcal

header = "# 1num 2Giso 3Esoln 4Gsoln(none) 5nu 6mu 7Gsoln(est) 8Sconf 9Sqha\n"

with open(oup, "w") as fout:
    fout.write(header)
    for m in ("04", "06", "B", "T", "S", "A"):
        mol = m
        base = home / f"{mol}acid"

        print(f"Processing {mol}acid")

        # Giso
        path = base / "07_umbrella" / "ana" / "pmfdelg.dat"

        Giso = None
        if path.is_file():
            with open(path) as f:
                for line in f:
                    if "deltaG bsMean:" in line:
                        Giso = -float(line.split("deltaG bsMean:")[1].strip())
                        break

        if Giso is None:
            print(f"  ERROR: Giso not found: {path}")
            continue

        # Esoln
        path = base / "09_syn" / "xvgdelg.dat"

        Gsoln = None
        EsolnA = None
        EsolnB = None
        Esoln = None

        if path.is_file():
            with open(path) as f:
                for line in f:
                    if "intE_l bsMean:" in line:
                        EsolnA = float(line.split("intE_l bsMean:")[1].strip())

        path = base / "08_anti" / "xvgdelg.dat"

        if path.is_file():
            with open(path) as f:
                for line in f:
                    if "intE_u bsMean:" in line:
                        EsolnB = float(line.split("intE_u bsMean:")[1].strip())
        
        Esoln = EsolnB - EsolnA

        if EsolnA is None or EsolnB is None:
            print(f"  ERROR: EsolnA/EsolnB not found: {path}")
            continue

        # QHA entropy
        def get_qha_entropy(directory):
            path = base / directory / "qha.log"

            if not path.is_file():
                print(f"  ERROR: QHA file not found: {path}")
                return None

            pattern = re.compile(
                r"The Entropy due to the Quasiharmonic analysis is\s+"
                r"([-+0-9.eE]+)\s+J/mol K"
            )

            with open(path) as f:
                for line in f:
                    match = pattern.search(line)
                    if match:
                        entropy = float(match.group(1))
                        return T * entropy / C

            print(f"  ERROR: entropy not found: {path}")
            return None

        qhaA = get_qha_entropy("09_syn/aqha")
        qhaB = get_qha_entropy("08_anti/bqha")

        if qhaA is None or qhaB is None:
            continue

        # mu and nu
        def get_mu_nu(filename):
            path = base / filename

            if not path.is_file():
                print(f"  ERROR: file not found: {path}")
                return None, None

            with open(path) as f:
                for line in f:
                    if line.startswith("#"):
                        continue

                    data = line.split()

                    if len(data) >= 5 and int(float(data[0])) == 100:
                        mu = float(data[1])
                        nu = float(data[4])
                        return mu, nu

            print(f"  ERROR: row 150 not found: {path}")
            return None, None

        muA, nuA = get_mu_nu("a.dat")
        muB, nuB = get_mu_nu("b.dat")

        if muA is None or muB is None:
            continue

        # Differences
        dmu = muB - muA
        dnu = nuB - nuA

        # Gsoln(est) = Giso + (muB - muA)
        Gsoln_est = Giso + dmu

        # Sconf = Giso + dmu - dnu - Esoln
        Sconf = Giso + dmu - dnu - Esoln

        # QHA entropy difference
        Sqha = qhaB - qhaA

        fout.write(
            f"{m} "
            f"{Giso:16.8f} "
            f"{Esoln:16.8f} "
            f"{Gsoln} "
            f"{dnu:16.8f} "
            f"{dmu:16.8f} "
            f"{Gsoln_est:16.8f} "
            f"{Sconf:16.8f} "
            f"{Sqha:16.8f}\n"
        )

print(f"Output: {oup}")
