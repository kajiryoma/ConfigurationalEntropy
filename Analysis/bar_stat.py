#!/usr/bin/env python3
import numpy as np
import argparse
from sibar import Newton_Raphson, Standard_Error
# Calc solvation free energy via solvent-integrated bar method 
# Estimate its bootstrap and standard error
# Output convergence with respect to the number of samples

# constant
KB = 0.0019872041      # Boltzmann constant [kcal/(mol*K)]
T = 300.0              # temperature [K]
BETA = 1 / (KB * T)    # inverse temperature

def Parse_Args():
  parser = argparse.ArgumentParser(description="solvent integrated bar for slvfe")
  parser.add_argument("-fl", default="03_lowerA/solbar.dat", help="input lower file")
  parser.add_argument("-fu", default="05_upperA/solbar.dat", help="input upper file")
  parser.add_argument("-o", default="solbar.log", help="oup file")
  parser.add_argument("-r", type=int, default=1, help="column number")
  return parser.parse_args()

def Read_Data(filename):
  data = []
  with open(filename, 'r') as file:
    for line in file:
      try:
        tokens = line.split()
#        num = int(tokens[0])
        value = float(tokens[1])*0.239
        data.append(value)
      except (IndexError,ValueError):
        continue
  return np.array(data)

def Bootstrap_m(data,n_boot=100):
  N = data.size
  vals = []

  for _ in range(n_boot):
    idx = np.random.randint(0,N,N)
    vals.append(np.mean(data[idx]))
  vals = np.array(vals)
  mean_est = np.mean(vals)
  std_est = np.std(vals,ddof=1)
  return std_est

def Bootstrap_D(upps,lows,n_boot=100):
  N = upps.size
  vals = []

  for _ in range(n_boot):
    lidx = np.random.randint(0,N,N)
    uidx = np.random.randint(0,N,N)
    vals.append(Newton_Raphson(upps[uidx],lows[lidx]))
  vals = np.array(vals)
  mean_est = np.mean(vals)
  std_est = np.std(vals,ddof=1)
  return std_est

def Expave_Pos(data):
  data = np.asarray(data, dtype=np.float64)
  xt = data * BETA

  m = np.max(xt)
  y = np.exp(xt-m)
  y_mean = np.mean(y)
  y_var = np.var(y, ddof=1)
  N =len(y)
  value = (m + np.log(y_mean)) / BETA
  se = np.sqrt(y_var / N) / (BETA * y_mean)
  return value, se

def Expave_Neg(data):
  data = np.asarray(data, dtype=np.float64)
  xt = -data * BETA
  m = np.max(xt)
  y = np.exp(xt-m)
  y_mean = np.mean(y)
  y_var = np.var(y, ddof=1)
  N =len(y)
  value = -(m + np.log(y_mean)) / BETA
  se = np.sqrt(y_var/ N) /(BETA * y_mean)
  return value, se

def SolvIntBar(lower,upper,filename):
  size = max(lower.size,upper.size)
  slvfes = []
  errors = []
  with open(filename, 'w') as file:
    file.write("# 1num 2slvfe 3error 4boot 5lower 6boot 7upper 8boot 9explow 10errlow 11expupp 12 errupp\n")

    for s in range(1,size+1):
      sublow = lower[0:min(s,lower.size)]
      subupp = upper[0:min(s,upper.size)]

      # exponential average
      lexp,lse = Expave_Pos(sublow)
      uexp,use = Expave_Neg(subupp)

      # bar calculation
      D = Newton_Raphson(subupp,sublow)
      slvfe = - D - KB * T * np.log(sublow.size/subupp.size)
      boot_D = Bootstrap_D(subupp,sublow)
      boot_u = Bootstrap_m(subupp)
      boot_l = Bootstrap_m(sublow)
      error = Standard_Error(min(s,upper.size),min(s,lower.size),subupp,slvfe)
      sterr = np.sqrt(abs(error)) 
      slvfes.append(slvfe)
      errors.append(sterr)
      line = f"{s} {slvfe:.6f} {sterr:.6f} {boot_D:.6f} {sublow.mean():.6f} {boot_l:.6f} {subupp.mean():.6f} {boot_u:.6f} {lexp:.6f} {lse:.6f} {uexp:.6f} {use:.6f}\n"
      file.write(line)



def main():
  args = Parse_Args()
  lower = Read_Data(args.fl)
  upper = Read_Data(args.fu)
  SolvIntBar(lower,upper,args.o)

if __name__ == "__main__":
  main()
