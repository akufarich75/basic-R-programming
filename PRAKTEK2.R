print("hello world!")
a = "hello world!"
print(a)
"hello world! 'im farich'"
"\"hello\""
a1 = "aku"
a2 = "farich"
a3 = "aldyansyah"
aish = c(a1,a2,a3)
aish
writeLines(aish)
writeLines(aish, sep=" ")
writeLines(aish, sep="\n")
print("aku \n farich")
val = 3.14623746
print(val)
as.character(val)
format(val,digit=3)
formatC(val,format="f", digits=3)
formatC(val,format="g", digits=3)
formatC(val,format="e", digits=3)

percent_change  <- c(4, -1.91, 3.00, -5.002)
income <-  c(72.19, 1030.18, 10291.93, 1189192.18)
p_values <- c(0.12, 0.98, 0.0000191, 0.00000000002)
formatC(income, format="f", digits=2)
format(income, digits=2)
format(income, scientific=T)

formatted_income <- format(income, digits = 2)
# Print formatted_income
formatted_income
# Call writeLines() on the formatted income
writeLines(formatted_income)
# Define trimmed_income
trimmed_income <- format(income, digits=2, trim=T)
# Call writeLines() on the trimmed_income
writeLines(trimmed_income)
# Define pretty_income
pretty_income <- format(income, digits=2, big.mark=',')
pretty_percent <-formatC(percent_change, format='f', flag="+", digits=1)
# Call writeLines() on the pretty_income
writeLines(pretty_percent)
writeLines(pretty_income)

