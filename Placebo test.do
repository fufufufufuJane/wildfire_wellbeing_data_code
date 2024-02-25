gen Post_las1 = (sold_time_format > 21158) & !missing(sold_time_format) 
gen Post_las1xTreat_150 = Post_las1 * Treat_150
reghdfe pending_sale_price_w_ln Post_las1 Treat_150 Post_las1xTreat_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w, absorb(sold_year zipcode) 
est store m7
esttab m7 using anweiji1.rtf, r2 ar2 se replace nogap
