gen Post = (sold_time_format > 21523) & !missing(sold_time_format) 

gen Treat_150 = (assigned_value <= 150) & !missing(assigned_value)


logout, save(test1) word replace: tabstat pending_sale_price_w b19049_007 livingareavalue_w yearbuilt bedrooms_w bathrooms_w parking_w, by(Treat_150) stat(count mean sd min max) col(stat) format(%10.2f)

gen PostxTreat_150 = Post * Treat_150


reghdfe pending_sale_price_w_ln Post Treat_150 PostxTreat_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(sold_year zipcode) 
est store m6


esttab m6 using reg2.rtf, r2 ar2 se replace nogap
