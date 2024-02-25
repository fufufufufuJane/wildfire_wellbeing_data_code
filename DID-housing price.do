* boundary
* Post1
reghdfe pending_sale_price_w_ln Post1 Treat_bd Post1xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 1, absorb(zipcode) 
est store o1
reghdfe pending_sale_price_w_ln Post1 Treat_bd Post1xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 2, absorb(zipcode) 
est store o2
reghdfe pending_sale_price_w_ln Post1 Treat_bd Post1xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 3, absorb(zipcode) 
est store o3
reghdfe pending_sale_price_w_ln Post1 Treat_bd Post1xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 4, absorb(zipcode) 
est store o4
reghdfe pending_sale_price_w_ln Post1 Treat_bd Post1xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 5, absorb(zipcode) 
est store o5
* esttab o1 o2 o3 o4 o5 using reg4.rtf, r2 ar2 se replace nogap

* Post2
reghdfe pending_sale_price_w_ln Post2 Treat_bd Post2xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 1, absorb(zipcode) 
est store p1
reghdfe pending_sale_price_w_ln Post2 Treat_bd Post2xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 2, absorb(zipcode) 
est store p2
reghdfe pending_sale_price_w_ln Post2 Treat_bd Post2xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 3, absorb(zipcode) 
est store p3
reghdfe pending_sale_price_w_ln Post2 Treat_bd Post2xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 4, absorb(zipcode) 
est store p4
reghdfe pending_sale_price_w_ln Post2 Treat_bd Post2xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 5, absorb(zipcode) 
est store p5
* esttab p1 p2 p3 p4 p5 using reg5.rtf, r2 ar2 se replace nogap

* Post3
reghdfe pending_sale_price_w_ln Post3 Treat_bd Post3xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 1, absorb(zipcode) 
est store q1
reghdfe pending_sale_price_w_ln Post3 Treat_bd Post3xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 2, absorb(zipcode) 
est store q2
reghdfe pending_sale_price_w_ln Post3 Treat_bd Post3xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 3, absorb(zipcode) 
est store q3
reghdfe pending_sale_price_w_ln Post3 Treat_bd Post3xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 4, absorb(zipcode) 
est store q4
reghdfe pending_sale_price_w_ln Post3 Treat_bd Post3xTreat_bd yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 5, absorb(zipcode) 
est store q5
esttab o1 o2 o3 o4 o5 p1 p2 p3 p4 p5 q1 q2 q3 q4 q5 using reg6.rtf, r2 ar2 se replace nogap

* boundary-50miles
* Post1
reghdfe pending_sale_price_w_ln Post1 Treat_bd_50 Post1xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 1, absorb(zipcode) 
est store e1
reghdfe pending_sale_price_w_ln Post1 Treat_bd_50 Post1xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 2, absorb(zipcode) 
est store e2
reghdfe pending_sale_price_w_ln Post1 Treat_bd_50 Post1xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 3, absorb(zipcode) 
est store e3
reghdfe pending_sale_price_w_ln Post1 Treat_bd_50 Post1xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 4, absorb(zipcode) 
est store e4
reghdfe pending_sale_price_w_ln Post1 Treat_bd_50 Post1xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 5, absorb(zipcode) 
est store e5
* esttab o1 o2 o3 o4 o5 using reg4.rtf, r2 ar2 se replace nogap

* Post2
reghdfe pending_sale_price_w_ln Post2 Treat_bd_50 Post2xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 1, absorb(zipcode) 
est store f1
reghdfe pending_sale_price_w_ln Post2 Treat_bd_50 Post2xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 2, absorb(zipcode) 
est store f2
reghdfe pending_sale_price_w_ln Post2 Treat_bd_50 Post2xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 3, absorb(zipcode) 
est store f3
reghdfe pending_sale_price_w_ln Post2 Treat_bd_50 Post2xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 4, absorb(zipcode) 
est store f4
reghdfe pending_sale_price_w_ln Post2 Treat_bd_50 Post2xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 5, absorb(zipcode) 
est store f5
* esttab p1 p2 p3 p4 p5 using reg5.rtf, r2 ar2 se replace nogap

* Post3
reghdfe pending_sale_price_w_ln Post3 Treat_bd_50 Post3xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 1, absorb(zipcode) 
est store g1
reghdfe pending_sale_price_w_ln Post3 Treat_bd_50 Post3xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 2, absorb(zipcode) 
est store g2
reghdfe pending_sale_price_w_ln Post3 Treat_bd_50 Post3xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 3, absorb(zipcode) 
est store g3
reghdfe pending_sale_price_w_ln Post3 Treat_bd_50 Post3xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 4, absorb(zipcode) 
est store g4
reghdfe pending_sale_price_w_ln Post3 Treat_bd_50 Post3xTreat_bd_50 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 5, absorb(zipcode) 
est store g5
esttab e1 e2 e3 e4 e5 f1 f2 f3 f4 f5 g1 g2 g3 g4 g5 using reg7.rtf, r2 ar2 se replace nogap

* 50-100
* Post1
reghdfe pending_sale_price_w_ln Post1 Treat_50_100 Post1xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 1, absorb(zipcode) 
est store e6
reghdfe pending_sale_price_w_ln Post1 Treat_50_100 Post1xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 2, absorb(zipcode) 
est store e7
reghdfe pending_sale_price_w_ln Post1 Treat_50_100 Post1xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 3, absorb(zipcode) 
est store e8
reghdfe pending_sale_price_w_ln Post1 Treat_50_100 Post1xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 4, absorb(zipcode) 
est store e9
reghdfe pending_sale_price_w_ln Post1 Treat_50_100 Post1xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 5, absorb(zipcode) 
est store e10
* esttab o1 o2 o3 o4 o5 using reg4.rtf, r2 ar2 se replace nogap

* Post2
reghdfe pending_sale_price_w_ln Post2 Treat_50_100 Post2xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 1, absorb(zipcode) 
est store f6
reghdfe pending_sale_price_w_ln Post2 Treat_50_100 Post2xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 2, absorb(zipcode) 
est store f7
reghdfe pending_sale_price_w_ln Post2 Treat_50_100 Post2xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 3, absorb(zipcode) 
est store f8
reghdfe pending_sale_price_w_ln Post2 Treat_50_100 Post2xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 4, absorb(zipcode) 
est store f9
reghdfe pending_sale_price_w_ln Post2 Treat_50_100 Post2xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 5, absorb(zipcode) 
est store f10
* esttab p1 p2 p3 p4 p5 using reg5.rtf, r2 ar2 se replace nogap

* Post3
reghdfe pending_sale_price_w_ln Post3 Treat_50_100 Post3xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 1, absorb(zipcode) 
est store g6
reghdfe pending_sale_price_w_ln Post3 Treat_50_100 Post3xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 2, absorb(zipcode) 
est store g7
reghdfe pending_sale_price_w_ln Post3 Treat_50_100 Post3xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 3, absorb(zipcode) 
est store g8
reghdfe pending_sale_price_w_ln Post3 Treat_50_100 Post3xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 4, absorb(zipcode) 
est store g9
reghdfe pending_sale_price_w_ln Post3 Treat_50_100 Post3xTreat_50_100 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 5, absorb(zipcode) 
est store g10
esttab e6 e7 e8 e9 e10 f6 f7 f8 f9 f10 g6 g7 g8 g9 g10 using reg8.rtf, r2 ar2 se replace nogap

* 100-150
* Post1
reghdfe pending_sale_price_w_ln Post1 Treat_100_150 Post1xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 1, absorb(zipcode) 
est store o6
reghdfe pending_sale_price_w_ln Post1 Treat_100_150 Post1xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 2, absorb(zipcode) 
est store o7
reghdfe pending_sale_price_w_ln Post1 Treat_100_150 Post1xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 3, absorb(zipcode) 
est store o8
reghdfe pending_sale_price_w_ln Post1 Treat_100_150 Post1xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 4, absorb(zipcode) 
est store o9
reghdfe pending_sale_price_w_ln Post1 Treat_100_150 Post1xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 5, absorb(zipcode) 
est store o10
* esttab o1 o2 o3 o4 o5 using reg4.rtf, r2 ar2 se replace nogap

* Post2
reghdfe pending_sale_price_w_ln Post2 Treat_100_150 Post2xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 1, absorb(zipcode) 
est store p6
reghdfe pending_sale_price_w_ln Post2 Treat_100_150 Post2xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 2, absorb(zipcode) 
est store p7
reghdfe pending_sale_price_w_ln Post2 Treat_100_150 Post2xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 3, absorb(zipcode) 
est store p8
reghdfe pending_sale_price_w_ln Post2 Treat_100_150 Post2xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 4, absorb(zipcode) 
est store p9
reghdfe pending_sale_price_w_ln Post2 Treat_100_150 Post2xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 5, absorb(zipcode) 
est store p10
* esttab p1 p2 p3 p4 p5 using reg5.rtf, r2 ar2 se replace nogap

* Post3
reghdfe pending_sale_price_w_ln Post3 Treat_100_150 Post3xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 1, absorb(zipcode) 
est store q6
reghdfe pending_sale_price_w_ln Post3 Treat_100_150 Post3xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 2, absorb(zipcode) 
est store q7
reghdfe pending_sale_price_w_ln Post3 Treat_100_150 Post3xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 3, absorb(zipcode) 
est store q8
reghdfe pending_sale_price_w_ln Post3 Treat_100_150 Post3xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 4, absorb(zipcode) 
est store q9
reghdfe pending_sale_price_w_ln Post3 Treat_100_150 Post3xTreat_100_150 yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w if incomelevel == 5, absorb(zipcode) 
est store q10
esttab o6 o7 o8 o9 o10 p6 p7 p8 p9 p10 q6 q7 q8 q9 q10 using reg9.rtf, r2 ar2 se replace nogap
