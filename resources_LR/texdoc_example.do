* Housekeeping
clear 
set more off

global tables = "C:\Users\LR\Desktop\Lucas Rosso\lucas-rosso.github.io\resources_LR"

sysuse auto, clear


*****************************************************************************************
*  DESCRIPTIVE STATS
*****************************************************************************************

foreach var of varlist price mpg weight length {

	local `var' = ""

	summ `var', detail

	foreach stat in "mean" "p50" "sd" "min" "max" "N" {

		if "`stat'" != "N" local aux: di %9.2fc r(`stat')
		else local aux: di %9.0fc r(`stat')

		local `var' = "``var'' & `aux'"
	}
}


texdoc i "$tables\desc_stats.tex", replace force
tex \begin{tabular}{m{14em}*{6}{>{\centering\arraybackslash}m{1.4cm}}} \toprule
// tex  & \textbf{Mean} & \textbf{Std. Dev.}  & \textbf{Min}  & \textbf{Max} & \textbf{Obs.} \\ \midrule
tex  & Mean & Median & Std. Dev.  & Min  & Max & Obs. \\ \midrule
tex Price `price'           \\
tex Mileage (mpg) `mpg'     \\
tex Weigth (lbs.) `weight'  \\
tex Length `length'         \\ \bottomrule
tex \end{tabular}
texdoc close 

* Pre-allocate some local macros
local weight     = " &"
local weight_se  = " &"
local length     = " & &"
local length_se  = " & &"
local ind = 0

foreach var of varlist price weight length {

	local ind_var = "`ind_var'" + " `var'"
	local ind     = `ind' + 1
	display "Regression `ind': dep. var: mpg, ind. vars: `ind_var'"

	* Estimate regression
	reg mpg `ind_var', r

	* Get var-cov matrix
	matrix vc = e(V)

	* ---------------------------------------------
	* Get Obs and adj. R2
	local N:      di %9.0f e(N)
	local adj_r2: di %9.3fc e(r2_a)

	local obs = "`obs'" + " & `N'"
	local r2  = "`r2'"  + " & `adj_r2'"
	* ---------------------------------------------

	* ---------------------------------------------
	* Price beta, std errors and ***
	qui test _b[price] = 0
	local p: di %12.3fc r(p)
	local star = cond(`p'<.01,"***",cond(`p'<.05,"**",cond(`p'<.1,"*","")))
	local beta:    di %9.3fc _b[price] 
	local std_err: di %5.3fc sqrt(vc[1,1]) 

	local price    = "`price'"    + " & `beta'`star'"
	local price_se = "`price_se'" + " & (`std_err')"
	* ---------------------------------------------

	* ---------------------------------------------
	* Weight beta, std erros and ***
	if `ind' > 1 {
		qui test _b[weight] = 0
		local p: di %12.3fc r(p)
		local star = cond(`p'<.01,"***",cond(`p'<.05,"**",cond(`p'<.1,"*","")))
		local beta: di %9.3fc _b[weight] 
		local std_err: di %5.3fc sqrt(vc[2,2])

		local weight    = "`weight'"    + " & `beta'`star'"
		local weight_se = "`weight_se'" + " & (`std_err')"	
	}
	* --------------------------------------------- 

	* ---------------------------------------------
	* Length beta, std erros and ***
	if `ind' > 2 {
		qui test _b[length] = 0
		local p: di %12.3fc r(p)
		local star = cond(`p'<.01,"***",cond(`p'<.05,"**",cond(`p'<.1,"*","")))
		local beta: di %9.3fc _b[length] 
		local std_err: di %5.3fc sqrt(vc[3,3])

		local length    = "`length'"    + " & `beta'`star'"
		local length_se = "`length_se'" + " & (`std_err')"	
	}
	* --------------------------------------------- 
}

* Create latex table
texdoc i "${tables}/texdoc_example.tex", replace force
	tex \begin{tabular}{l*{3}{>{\centering\arraybackslash}m{3cm}}} \toprule
	tex  & \multicolumn{3}{c}{Dep. Variable: Mileage (mpg)}  \\ \cline{2-4} 
	tex                  & (1) & (2) & (3) \\ \midrule
	tex Price              `price'         \\
	tex                    `price_se'      \\
	tex Weigth             `weight'        \\ 
	tex                    `weight_se'     \\
	tex Length             `length'        \\
	tex                    `length_se'     \\ \midrule
	tex Observations       `obs'           \\
	tex Adj. \$ R^{2} \$   `r2'            \\ \bottomrule
	tex \end{tabular}
texdoc close 
