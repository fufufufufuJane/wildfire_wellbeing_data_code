
gen pd = 0 if inrange(sold_time_format, 21496, 21523)
replace pd = -2 if inrange(sold_time_format, 21435, 21464)
replace pd = -1 if inrange(sold_time_format, 21465, 21495)
replace pd = 1 if inrange(sold_time_format, 21524, 21554)
replace pd = 2 if inrange(sold_time_format, 21555, 21585)
replace pd = 3 if inrange(sold_time_format, 21586, 21613)


gen current = (pd == 0 & Treat_150 == 1)

forvalues i = 6(-1)1{
  gen pre_`i' = (pd == -`i' & Treat_150 == 1) 
}

forvalues j = 1(1)6{
  gen  post_`j' = (pd == `j' & Treat_150 == 1)
}

reghdfe pending_sale_price_w_ln Post Treat_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w pre_* current post_*, absorb(sold_year zipcode)
est store y1
coefplot y1,keep (pre* current post*) vertical recast(connnet) yline(0) xline(4,lp(dash))
