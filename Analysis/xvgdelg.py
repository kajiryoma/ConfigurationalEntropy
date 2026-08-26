#!/usr/bin/env python3
import numpy as np
import argparse, sys, math
from maininfo import MainInfo
from xvgparser import XVGparser, XVGdata

# calculate delta G and delta E in upper(B) -> lower(A) from time-series data

# constant
KB = 0.0019872041      # Boltzmann constant [kcal/(mol*K)]
T = 300.0              # temperature [K]
BETA = 1 / (KB * T)    # inverse temperature

class Partition:
  def __init__(self, data, limit):
    self.cl = data[:,1] < limit
    self.cu = data[:,1] >= limit
    self.l = np.where(self.cl)[0]
    self.u = np.where(self.cu)[0]

def Parse_Args():
  parser = argparse.ArgumentParser(description="calculate Delta G upper(B) to lower(A) from xvg file")
  parser.add_argument("-f", default="dist.xvg", help="input file")
  parser.add_argument("-l", type=float, default=0.4, help="limit value")
  parser.add_argument("-r", type=int, default=0, help="column number")
  parser.add_argument("-e", type=int, default=1, help="column number for energy or additional data")
  parser.add_argument("-o", default="xvgdelg.dat", help="output file")
  parser.add_argument("-a", default="A.dat", help="output file")
  parser.add_argument("-ej", type=int, default=1, help="energy unit (default: J -> cal, 0: cal -> cal)")
  parser.add_argument("-abs", type=bool, default=False, help="abs")
  parser.add_argument("-w", default="weight.dat", help="input weight file")
  return parser.parse_args()

def Parse_Data(args):
  data = []
  direc = XVGparser(args.f)
  dat = direc.data
  direc.Show_data()
  try:
    times = dat.x
    values = dat.ycols[:,args.r]
    if args.abs == True:
      values = abs(values)
      print("abs mode")
    if args.ej == 1:
      eners = dat.ycols[:,args.e]*0.239 if dat.ycols.shape[1] >= 2 else None
    else:
      eners = dat.ycols[:,args.e] if dat.ycols.shape[1] >= 2 else None
    data = np.column_stack((times,values,eners)) if eners is not None else np.column_stack((times,values))
  except (IndexError, ValueError):
    raise RuntimeError() from e
  return np.array(data)

def Read_Data(args):
#old function
  filename = args.f
  colunum = args.r
  if args.abs == true:
    colunum = abs(colunum)
    print("abs mode")
  enecolu = args.e
  data = []
  count = 0
  nextt = 1
  with open(filename, 'r') as file:
    for line in file:
      count += 1
      if count >= nextt:
        sys.stdout.write(f"\r<{count} rows ... reading>")
        sys.stdout.flush()
        exp = int(math.floor(math.log10(count)))
        base = 10 ** exp
        digit = (count // base) + 1
        nextt = digit * base
      try:
        tokens = line.split()
        time = float(tokens[0])
        value = float(tokens[colunum])
        eng = float(tokens[enecolu])*0.239 if len(tokens) > enecolu else None
        data.append((time,value,eng))
      except (IndexError, ValueError):
        continue
  return np.array(data)


def Calc_DeltaG(data,lower,upper):
  a = lower.size
  b = upper.size
  lene = a
  uene = b
  try:
    deltaG = -KB * T * np.log(a / b)
    error = KB * T * np.sqrt(b / (a * (b + a)))
    if data.shape[1] == 3:
      lene = np.mean(data[lower,2])
      uene = np.mean(data[upper,2])
  except ZeroDivisionError as e:
    deltaG = None
    error = None
  return deltaG,lene,uene

def Save_Time(data,indicates,filename,num):
  times = data[indicates,0]
  values = data[indicates,1]
  eners = data[indicates,2] if data.shape[1] > 2 else None

  if len(times) <= num:
    slct_times = times
    slct_values = values
    slct_eners = eners
    print(f"use whole {len(times)} data in {filename}")
  else:
    indices = np.random.choice(len(times),size=num,replace=False)
    indices.sort()
    slct_times = times[indices]
    slct_values = values[indices] if values is not None else None
    slct_eners = eners[indices] if eners is not None else None
#  np.savetxt(filename,times,fmt="%.0f") 
  if slct_values is not None:
    if slct_eners is not None:
      np.savetxt(filename, np.column_stack((slct_times, slct_values, slct_eners)), fmt="%.0f %.6f %.6f") 
    else:
      np.savetxt(filename, np.column_stack((slct_times, slct_values)), fmt="%.0f %.6f") 


def Out(line,filename=None):
  print(line)
  if filename is not None:
    filename.write("# " + line + "\n")

def Print_Stats(gvals,lvals,uvals,filename=None):
  f = open(filename, "a") if filename else None
  Out(f"deltaG bsMean: {np.mean(gvals)}", f)
  Out(f"deltaG bsError: {np.std(gvals,ddof=1)}", f)
  Out(f"intE_l bsMean: {np.mean(lvals)}", f)
  Out(f"intE_l bsError: {np.std(lvals,ddof=1)}", f)
  Out(f"intE_u bsMean: {np.mean(uvals)}", f)
  Out(f"intE_u bsError: {np.std(uvals,ddof=1)}", f)
  Out(f"delE bsMean: {np.mean(lvals-uvals)}", f)
  Out(f"delE bsError: {np.std(lvals-uvals,ddof=1)}", f)
  
  if f:
    f.close()

def Bootstrap_G(data,part,args,n_boot=500):
  N = data.shape[0]
  gvals = np.empty(n_boot)
  lvals = np.empty(n_boot)
  uvals = np.empty(n_boot)

  for i in range(n_boot):
    sys.stdout.write(f"\r<bootstrap calculation: {i} / {n_boot} ...>")
    sys.stdout.flush()
    idx = np.random.randint(0,N,N)
    counts = np.bincount(idx,minlength=N)
    lower = np.repeat(part.l,counts[part.l])
    upper = np.repeat(part.u,counts[part.u])
    delg, low, upp = Calc_DeltaG(data,lower,upper)
    gvals[i] = delg
    lvals[i] = low
    uvals[i] = upp

  sys.stdout.write(f"\r<bootstrap calculation: {i+1} / {n_boot} done!>\n")
  MainInfo(args.o)
  Print_Stats(gvals,lvals,uvals,args.o)
  #error = np.sqrt(np.std(lvals,ddof=1)**2 + np.std(uvals,ddof=1)**2)
  #print("derref", error)

def main():
  MainInfo()
  args = Parse_Args()
  data = Parse_Data(args)
#old function
#  data = Read_Data(args)
  part = Partition(data,args.l)
  delg, low, upp = Calc_DeltaG(data,part.l,part.u)
  Save_Time(data,part.l,"A.dat",200)
  Save_Time(data,part.u,"B.dat",200)
  Save_Time(data,part.l,"Awhole.dat",10000000000)
  Save_Time(data,part.u,"Bwhole.dat",10000000000)

  Bootstrap_G(data,part,args)
  print("=======deltaG :", delg)
  if data.shape[1] > 1:
      print("~~~~potentialA :", low)
      print("~~~~potentialB :", upp)

if __name__ == "__main__":
  main()
