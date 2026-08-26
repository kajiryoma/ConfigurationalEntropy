import sys
import os
from datetime import datetime

def MainInfo(filename=None):
  
  now = datetime.now().strftime("%a %b %d %H:%M:%S %Y")
  py_exec = sys.executable
  cwd = os.path.abspath(os.getcwd())
  cmd_line = " ".join(sys.argv)

  lines = [
    f"========================================================",
    f"  date:  {now}",
    f"  executable:  {py_exec}",
    f"  working dir:  {cwd}",
    f"  command line:  {cmd_line}",
    f"========================================================"
  ]

  if filename:
    with open(filename, "w") as file:
      for line in lines:
        file.write("# " + line + "\n")
  else:
    for line in lines:
      print(line)

