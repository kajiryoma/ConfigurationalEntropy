# Calculation of Changes in Configurational Entropy in Small Molecules

This repository contains the input files, simulation scripts, and analysis scripts used to reproduce the results presented in the accompanying manuscript.

### Layout

* `Figure/`
  Contains the numerical data and Gnuplot scripts required to generate all figures in the manuscript, including the TOC graphic and Figure 9.

* `Analysis/`
  Contains Python scripts for analyzing the simulation results:

  * `sibar.py`: Solves the nonlinear equations required for the calculation of solvation free energies.
  * `bar_stat.py`: Evaluates the convergence of the calculated solvation free energies.
  * `xvgdelg.py`: Calculates free-energy changes and potential-energy changes.

The repository contains three classes of solutes: `Alkane`, `Diol`, and `Acid`. Each class contains the following directories:

* `structure/`
  Contains the force-field files (`.itp` and `.top`), input structures (`.pdb`), and Packmol input files (`pack.inp`) for each solute.

* `mdp/`
  Contains the GROMACS parameter files (`.mdp`) required for equilibration and production simulations for the three types of molecular simulations described in the manuscript.

* `output.py`
  Collects the calculation results. Run with `python output.py`.
