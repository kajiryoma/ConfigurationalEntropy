#!/usr/bin/env python3
import numpy as np

# Compute free energy change from A to B using Bennett acceptance ratio (BAR)

# constant
KB = 0.0019872041      # Boltzmann constant [kcal/(mol*K)]
T = 300.0              # temperature [K]
BETA = 1 / (KB * T)    # inverse temperature


def Fermi_Function(x,D=0):
  z = BETA * x
  f = 1 / (1 + np.exp(z))  
  return f


def Read_Data(filename):
  data = []
  with open(filename, 'r') as file:
    for line in file:
      try:
        tokens = line.split()
        value = float(tokens[0])   # read first token
        data.append(value)
      except (IndexError, ValueError):
        continue                   # skip empty and comment lines
  return np.array(data)


def Newton_Raphson(dataA, dataB):
  tolerance = 0.0001
  max_iterations = 100
  D = - np.concatenate((dataA, dataB)).mean()  # initial guess: mean value
  D_max = 99999
  D_min = -99999

  for count in range(max_iterations):
    f = 0                             # residual of the nonlinear equation
    df = 0                            # derivative of the residual
    Fa = Fermi_Function(dataA + D,D)
    Fb = Fermi_Function(- dataB - D,D)

    f = np.sum(Fa) - np.sum(Fb)

    if abs(f) < tolerance:
      break

    df = - np.sum(Fa * (1 - Fa))* BETA - np.sum(Fb * (1 - Fb)) * BETA  # derivative of the Fermi function
    dD = - f / df
    
    D_new = D + dD
    
    if dD < 0:
      D_max = min(D_max,D)  # or D_max = D
      if D_new < D_min:
        D_new = 0.5 * (D_min + D_max)
    elif dD >= 0:
      D_min = max(D_min,D)
      if D_new >= D_max:
        D_new = 0.5 * (D_min + D_max)

    D = D_new                       # Newton-Raphson update
  else:
    print("Convergence failed: reached maximum iterations")
  return D


def Standard_Error(NA, NB, dataA, deltaG):
  weights = 1 / ( (1/NA) + (1/NB) * np.exp(BETA * (dataA - deltaG)) )
  mean_weights = weights.mean()       # mean over dataA
  # square of standard error of deltaG
  sqerr = (KB * T)**2 * (1/mean_weights - 1/NA - 1/NB)
  return sqerr

# main
def main():
  # load energy changes from A to B, sampled in state A
  dataA = Read_Data('inputA.dat')
  NA = dataA.size
  
  # load energy changes from A to B, sampled in state B
  dataB = Read_Data('inputB.dat')
  NB = dataB.size
  
  # compute deltaG with Newton-Raphson method
  D = Newton_Raphson(dataA, dataB)
  deltaG = - D - KB * T * np.log(NB / NA)
  print("free energy change: ", deltaG, " kcal/mol")
  
  # estimate square of standard error
  sqerr = Standard_Error(NA, NB, dataA, deltaG)
  
  # standard error
  sterr = np.sqrt(sqerr)
  print("standard error: ", sterr, " kcal/mol")
if __name__ == "__main__":
    main()
