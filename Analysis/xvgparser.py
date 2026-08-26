import shlex
import numpy as np
import math
import sys

class XVGdata:
  def __init__(self,data,directives,filename=None):
    self.directives = directives
    self.filename = filename

    if data is not None and data.size > 0:
      self.x = data[:,0]
      self.ycols = data[:,1:] if data.shape[1] > 1 else np.empty((len(self.x),0))
    else:
      self.x = np.array([])
      self.ycols = np.empty((0,0))

    self.legends = self._legends_gen()

  def _legends_gen(self):
    n_y = self.ycols.shape[1]
    legends = [
      self.directives.legend.get(f"s{i}") for i in range(n_y)
    ] if hasattr(self.directives, "legend") else []

    for i in range(n_y):
      if not legends or i >= len(legends) or legends[i] is None:
        legends[i] = self.directives.yaxis if self.directives.yaxis else "Unknown"

    return legends
  
  def __repr__(self):
    if self.ycols is None:
      return "<XVGdata: empty!>"
    nrow, ncol = self.ycols.shape
    x = getattr(self.directives, "xaxis",None)
    legs_str = "\n  ".join([f"legend{i+1}: {l}" for i, l in enumerate(self.legends)]) \
                 if self.legends else "None"
    return (
    f"\r<{self.filename or 'unknown'}: {nrow} rows x {ncol} cols, xaxis: {x}>\n"
    f"  {legs_str}"
    )
  

class XVGdirective:
  def __init__(self):
    self.title = None
    self.xaxis = None
    self.yaxis = None
    self.subtitle = None
    self.legend = {}
    self.type = None
    self.other = []

  def __repr__(self):
    s = f"title: {self.title}\n"
    s += f"x-axis: {self.xaxis}\n"
    s += f"y-axis: {self.yaxis}\n"
    s += f"subtitle: {self.subtitle}\n"
    s += f"type: {self.type}\n"
    s += f"legends: {self.legend}\n"
    if self.other:
      s += f"others: {self.other}\n"
    return s

class XVGparser:
  def __init__(self, filename):
    self.filename = filename
    self.directives = XVGdirective()
    self.data = None
    self._parse_file()

  def _parse_file(self):
    data_lines = []
    count = 0
    next_target = 1
    with open(self.filename, 'r') as file:
      for line in file:
        line = line.strip()
        if not line:
          continue
        if line.startswith(('@','#@')):
          tokens = shlex.split(line)
          self._parse_directive(tokens)
        elif line.startswith('#'):
          continue
        else:
          try:
            vals = line.split()
            data_lines.append([float(x) for x in vals])
            count += 1

            if count >= next_target:
              sys.stdout.write(f"\r<{self.filename}: {count} rows ... reading>")
              sys.stdout.flush()
              exp = int(math.floor(math.log10(count)))
              base = 10 ** exp
              digit = (count // base) + 1
              next_target = digit * base
          except ValueError:
            continue

    if not data_lines:
      raise ValueError("no numerical data in file:")

    data = np.array(data_lines)
    self.data = XVGdata(data,self.directives,self.filename)
    

  def _parse_directive(self, tokens):
    if len(tokens) < 2:
      return

    if tokens[1] == 'title':
      self.directives.title = tokens[2]
    elif tokens[1] == 'xaxis':
      self.directives.xaxis = tokens[3]
    elif tokens[1] == 'yaxis':
      self.directives.yaxis = tokens[3]
    elif tokens[1] == 'subtitle':
      self.directives.subtitle = tokens[2]
    elif tokens[0] == '@TYPE':
      self.directives.type = tokens[1]
    elif tokens[1].startswith('s') and tokens[2] == 'legend':
      self.directives.legend[tokens[1]] = tokens[3]
    else:
      self.directives.other.append(" ".join(tokens))
  

  def Show_directives(self):
    print(self.directives)
  def Show_data(self):
    print(self.data)

