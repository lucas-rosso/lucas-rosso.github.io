---
title: Nice Figures in STATA
subtitle: Some simple tricks to get nicer figures in STATA.

tags: []
categories: []

date: "2022-07-11"
lastMod: "2022-07-11"
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
image:
  caption: ""
  focal_point: ""

---

For some time I've struggled with how to both make nice figures in STATA and also use a consistent template relative to all figures within a text, latex set-up, etc.

Here is basically my set-up now:

1. ***Font***: I changed the font to match LaTex. [here](https://medium.com/the-stata-guide/stata-graphs-get-those-fonts-right-c38d35625142) a guide on how to do that.

2. ***Scheme***: modern. To install type 
``` stata
    net install scheme-modern, ///
    from("https://raw.githubusercontent.com/mdroste/stata-scheme-modern/master/")
```

3. Graph sizes, colors, etc:
```stata
    local color1      = "0 111 185" // blue
    local color2      = "212 81 24" // orange
    local colors      = `" "`color1'" "`color2'" "'

    local second_axis = `"ylabel(none,axis(2)) xlabel(none,axis(2)) xtitle("",axis(2)) ytitle("",axis(2))"'
    local label_size  = "xlabel(, labsize(large)) ylabel(, labsize(large)) ytitle(, size(large)) xtitle(, size(large)) legend(size(large))"
```

4. ***Close box***: Create and variable with all missing, then add to second axis.


The example of the figure above is computed as follows
```stata
	gen empty = .

	reg mean_exp_debtUS_12m_p2 l12.debt_change_yoy
	twoway ///
		(scatter mean_exp_debtUS_12m_p2 l12.debt_change_yoy if monthly_date <  `max_date', mcolor("`color'") msymbol(circle_hollow))   ///
		(scatter mean_exp_debtUS_12m_p2 l12.debt_change_yoy if monthly_date >= `max_date', mcolor("`color_2'") msymbol(circle_hollow)) ///
		(lfit    mean_exp_debtUS_12m_p2 l12.debt_change_yoy if monthly_date <  `max_date', lcolor("`color'"))   ///
		(lfit    mean_exp_debtUS_12m_p2 l12.debt_change_yoy if monthly_date >= `max_date', lcolor("`color_2'")) ///
		(line empty l12.debt_change_yoy, xaxis(2) yaxis(2) `second_axis'),   ///
		ytitle("{stSerif:E}{subscript:t}{stSerif:x}{subscript:t+12}") ///
		xtitle("{stSerif:x}{subscript:t}") ///
		title("A - Household Expectations", size(huge) color(black)) ///
		legend(order(1 "Pre `max_year'm`max_month'" 2 "Post `max_year'm`max_month'") rows(3) ring(0) pos(11)) ///
		`label_size' name("scatter1", replace) 
```