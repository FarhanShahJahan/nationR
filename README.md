# nationR

[![Build Status](https://travis-ci.org/FarhanShahJahan/nationR.svg?branch=master)](https://travis-ci.org/FarhanShahJahan/nationR)

nationR is an R package that provides functions to transform input data between different formats related to nationality, country name, ISO code (Alpha 2 & Alpha 3), and UN/Numeric code. It allows you to easily convert between these representations. 

Source:
1) https://www.nationsonline.org/oneworld/country_code_list.htm

## Installation

You can install the package from GitHub using the `devtools` package:

```R
# Install devtools if not already installed
if (!require(devtools)) {
  install.packages("devtools")
}

# Install nationR from GitHub
devtools::install_github("FarhanShahJahan/nationR")
```
Usage

```R
library(NationR)

nationality_list <- c("American", "Canadian")
country_names <- convert2country(nationality = nationality_list)
print(country_names)
