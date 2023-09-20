# nationR

[![Build Status](https://travis-ci.org/FarhanShahJahan/nationR.svg?branch=master)](https://travis-ci.org/FarhanShahJahan/nationR)

nationR is an R package that provides functions to transform input data between different formats related to nationality, country name, ISO code, and UN/Numeric code. It allows you to easily convert between these representations.

## Installation

You can install the package from GitHub using the `devtools` package:

```R
# Install devtools if not already installed
if (!require(devtools)) {
  install.packages("devtools")
}

# Install nationR from GitHub
devtools::install_github("FarhanShahJahan/nationR")
