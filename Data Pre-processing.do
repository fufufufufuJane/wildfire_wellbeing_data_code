
import delimited "output_202335cal.csv", encoding(UTF-8)
save
summarize



gen sold_time_format = date(sold_time, "YMD")
format sold_time_format %td

gen sold_year = real(substr(sold_time, 1, 4))



drop if hometype != "SingleFamily"
drop if yearbuilt <1000
drop if yearbuilt > 2023

drop if b19049_007 == 0
drop if b19049_007 == .


winsor2  livingareavalue, cut(1 99)
gen lnlivingareavalue_w = ln(livingareavalue_w)

winsor2  parking, cut(1 99)
winsor2  bedrooms, cut(1 99)
winsor2  bathrooms, cut(1 99)

winsor2  pending_sale_price, cut(1 99)
gen pending_sale_price_w_ln = ln(pending_sale_price_w)
