gen Treat_bd = 1 if assigned_value <= 0
replace Treat_bd = 0 if (assigned_value >= 151)
gen PostxTreat_bd = Post * Treat_bd

gen Treat_bd_50 = 1 if inrange(assigned_value, 1, 50)
replace Treat_bd_50 = 0 if (assigned_value >= 151)
gen PostxTreat_bd_50 = Post * Treat_bd_50

gen Treat_50_100 = 1 if inrange(assigned_value, 51, 100)
replace Treat_50_100 = 0 if (assigned_value >= 151)
gen PostxTreat_50_100 = Post * Treat_50_100

gen Treat_100_150 = 1 if inrange(assigned_value, 101, 150)
replace Treat_100_150 = 0 if (assigned_value >= 151)
gen PostxTreat_100_150 = Post * Treat_100_150


reghdfe pending_sale_price_w_ln Post Treat_bd PostxTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(sold_year zipcode) 
est store a1

reghdfe pending_sale_price_w_ln Post Treat_bd_50 PostxTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(sold_year zipcode) 
est store a2

reghdfe pending_sale_price_w_ln Post Treat_50_100 PostxTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(sold_year zipcode) 
est store a3

reghdfe pending_sale_price_w_ln Post Treat_100_150 PostxTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(sold_year zipcode) 
est store a4

esttab a1 a2 a3 a4 using reg3.rtf, r2 ar2 se replace nogap

reghdfe pending_sale_price_w_ln Post Treat_bd PostxTreat_bd Treat_bd_50 PostxTreat_bd_50 Treat_50_100 PostxTreat_50_100 Treat_100_150 PostxTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(sold_year zipcode) 
est store a5
