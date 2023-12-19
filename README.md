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

country_list <- c('India', 'Malaysia', 'Canada')

# the origin & target can be Country, Nationality, Alpha2, Alpha3 or UN_code
nation_convert(origin = 'Country', target = 'UN_code', origin_data = country_list)

print(country_names)
