gen Post1 = 1 if inrange(sold_time_format, 21523, 21888) 
replace Post1 = 0 if (sold_time_format < 21523)
gen Post1xTreat_bd = Post1 * Treat_bd
gen Post1xTreat_bd_50 = Post1 * Treat_bd_50
gen Post1xTreat_50_100 = Post1 * Treat_50_100
gen Post1xTreat_100_150 = Post1 * Treat_100_150

gen Post2 = 1 if inrange(sold_time_format, 21888, 22254)
replace Post2 = 0 if (sold_time_format < 21523)
gen Post2xTreat_bd = Post2 * Treat_bd
gen Post2xTreat_bd_50 = Post2 * Treat_bd_50
gen Post2xTreat_50_100 = Post2 * Treat_50_100
gen Post2xTreat_100_150 = Post2 * Treat_100_150

gen Post3 = 1 if inrange(sold_time_format, 22254, 22619)
replace Post3 = 0 if (sold_time_format < 21523)
gen Post3xTreat_bd = Post3 * Treat_bd
gen Post3xTreat_bd_50 = Post3 * Treat_bd_50
gen Post3xTreat_50_100 = Post3 * Treat_50_100
gen Post3xTreat_100_150 = Post3 * Treat_100_150


reghdfe pending_sale_price_w_ln Post1 Treat_bd Post1xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(zipcode) 
est store n1
reghdfe pending_sale_price_w_ln Post2 Treat_bd Post2xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(zipcode) 
est store n2
reghdfe pending_sale_price_w_ln Post3 Treat_bd Post3xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(zipcode) 
est store n3


reghdfe pending_sale_price_w_ln Post1 Treat_bd_50 Post1xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(zipcode) 
est store u1
reghdfe pending_sale_price_w_ln Post2 Treat_bd_50 Post2xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(zipcode) 
est store u2
reghdfe pending_sale_price_w_ln Post3 Treat_bd_50 Post3xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(zipcode) 
est store u3


reghdfe pending_sale_price_w_ln Post1 Treat_50_100 Post1xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(zipcode) 
est store v1
reghdfe pending_sale_price_w_ln Post2 Treat_50_100 Post2xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(zipcode) 
est store v2
reghdfe pending_sale_price_w_ln Post3 Treat_50_100 Post3xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(zipcode) 
est store v3


reghdfe pending_sale_price_w_ln Post1 Treat_100_150 Post1xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(zipcode) 
est store b1
reghdfe pending_sale_price_w_ln Post2 Treat_100_150 Post2xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(zipcode) 
est store b2
reghdfe pending_sale_price_w_ln Post3 Treat_100_150 Post3xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(zipcode) 
est store b3

esttab n1 n2 n3 u1 u2 u3 v1 v2 v3 b1 b2 b3 using reg4.rtf, r2 ar2 se replace nogap
