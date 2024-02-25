psmatch2 Treat_150  yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w ,outcome(pending_sale_price_w_ln) logit neighbor(1) noreplacement caliper(0.05)

pstest yearbuilt bedrooms_w bathrooms_w parking_w livingareavalue_w ,both group 
