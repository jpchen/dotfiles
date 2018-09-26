import numpy as np
import scipy as sp
import torch
from torch import Tensor
from torch.nn import Parameter
from torch.nn import functional as F
from torch.distributions import constraints
print("imported torch {}".format(torch.__version__))
import pyro
import pyro.distributions as dist
from pyro.distributions import *
from pyro.infer import SVI
from pyro.optim import Adam
T = Tensor
P = Parameter
nn = torch.nn
print("imported pyro {}".format(pyro.__version__))
