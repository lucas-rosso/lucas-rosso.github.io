---
title: 'Useful Commands in Stata'
subtitle: 'A list of commands I have found useful in empirical projects'
summary: A list of commands I have found useful in empirical projects.
tags: []
categories: []
date: "2021-11-15"
lastMod: "2021-11-15"
featured: false
draft: false


# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
image:
  caption: ""
  focal_point: ""

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

* [`wbopendata`](https://github.com/jpazvd/wbopendata): Download data from World Bank directly from STATA (`ssc install wbopendata`).

* [`reghdfe`](http://scorreia.com/software/reghdfe/index.html): Generalization of areg for multiple level of fixed effects and multi-way clustering (`ssc install reghdfe`).

* [`gtools`](https://github.com/mcaceresb/stata-gtools): Faster Stata for big data. Includes faster equivalents to collapse, reshape, egen and many more. Just need to add `g` to the command (e.g. `gcollapse`). To install all just type `ssc install gtools`.

* [`sumup`](https://github.com/matthieugomez/sumup): Summarize data by groups

* [`texdoc`](https://journals.sagepub.com/doi/pdf/10.1177/1536867X1601600201): Latex tables directly on STATA. Longer (but worth it) way to get results into latex tables directly from STATA (`ssc install texdoc`)

* [binscatter2](https://github.com/mdroste/stata-binscatter2) Faster binned scatterplots. It allows for multi-way fixed effects, unlike `binscatter` (`ssc install binscatter2`).

* `compress`: Attempts to reduce the amount of memory used for the data. Important when working with large datasets. For an efficient way of generating new variabels use `gen [data type] varlist = exp`, for example `gen int N_obs = _n`

* `levelsof`: transforms values of a string into local macros.

* `tokenize`: Divide strings into tokens

* `grc1leg2`: Add a common legend to combined graphs (findit grc1leg2). 

* `sendtoslack`: Send message to inform the code finished. Very helpful when working with large administrative data. 

* `codebook`: Command to describe data.
