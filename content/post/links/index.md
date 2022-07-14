---
title: Data and Links
subtitle: Collection of links for data, notes and code repositories

tags: []
categories: []

date: "2022-07-14"
lastMod: "2022-07-14"
featured: false
draft: false
---

## Data

Below a list of public data sources and some links to cleaning the data in STATA
### United States
- [***Survey of Consumer Expectations***](https://www.newyorkfed.org/microeconomics/sce#/): Rotating monthly panel of households started in June 2013 with information on expectations over inflation, government debt, growth, etc. Code for cleaning data (core module) in [link](https://github.com/lucas-rosso/Data_Cleaning_Codes)
- [***Consumer Expenditure Surveys***](https://www.bls.gov/cex/): Data on expenditures, income, and demographic characteristics of consumers in the United States
- [***Survey of Consumer Finances***](https://www.federalreserve.gov/econres/scfindex.htm): Triennial basis household survey that offers a rich classification of households assets and liabilities. Code to clean raw data for the period 1998-2019 in the following [link](https://github.com/lucas-rosso/Data_Cleaning_Codes). Just requires to add a 'raw' folder with (`.dta`) files and run `SCF/master.do`.

### Chile 
- [***CASEN***](http://observatorio.ministeriodesarrollosocial.gob.cl/encuesta-casen): Chile's main household survey. The survey is available on a bi(tri) annual basis for the period 1990-2020
- [***Encuesta Financiera de Hogares***](https://www.efhweb.cl/). Chilean version of the SCF. Made by the Central Bank of Chile since 2007.
- [***Unemployment Insurance Administrative Data***](https://github.com/lucas-rosso/Codes) (random sample): Data on workers affiliated to the unemployment insurance in Chile (2002 onwards). Information on taxable income, sector clasification, employee's identifier and county. Random samples are computed without replacement and thus can be merged to get up to 20% of the complete sample. See [link](https://github.com/lucas-rosso/Data_Cleaning_Codes) for STATA code to clean data.
- [***Central Bank's Statistics Database***](https://si3.bcentral.cl/siete): Aggregate data on output, inflation, unemployment, exchange rate, commodity prices and many other.

### Other
- [***NBER***](https://www.nber.org/research/data?page=1&perPage=50)
- [***World Bank***](https://data.worldbank.org/)
- [***IMF***](https://data.imf.org/?sk=388dfa60-1d26-4ade-b505-a05a558d9a42&sId=1479329132316)
- [***Penn World Tables***](https://www.rug.nl/ggdc/productivity/pwt/)
## Links
- ***Version Control Notes***: Online lecture with Git basics (plus notes) in [./missing-semester](https://missing.csail.mit.edu/2020/version-control/). Chapter on Git by Jesus Fernandez Villaverde (see [link](https://www.sas.upenn.edu/~jesusfv/Chapter_HPC_5_Git.pdf)).

- ***Solving HA models in continuous time***: Nice repository with examples of solving HA using finite-difference methods by Ben Moll (see [link](https://benjaminmoll.com/codes/))

- ***Useful links***: Repository with links to literature reviews, class materials, coding notes, etc (see [link](https://christinecai.github.io/items/PublicGoods.html))

- ***Resources for applyinh to PhD***: Alvin Christian public resources for pre-docs and PhD applications (see [link](https://www.alvinchristian.com/resources))