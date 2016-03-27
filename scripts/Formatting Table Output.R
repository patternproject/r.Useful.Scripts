## Formatting table output in R
## http://www.magesblog.com/2016/01/formatting-table-output-in-r.html?m=1


# Formatting data for output in a table can be a bit of a pain in R. The package formattable by Kun Ren and Kenton Russell provides some intuitive functions to create good looking tables for the R console or HTML quickly. The package home page demonstrates the functions with illustrative examples nicely.
# 
# There are a few points I really like:
#   the functions accounting, currency, percent transform numbers into better human readable output
# cells can be highlighted by adding color information
# contextual icons can be added, e.g. from Glyphicons
# output can be displayed in RStudio's viewer pane

install.packages("formattable")
library(formattable)
DF <- data.frame(Ticker=c("", "", "", "IBM", "AAPL", "MSFT"),
                 Name=c("Dow Jones", "S&P 500", "Technology", 
                        "IBM", "Apple", "Microsoft"),
                 Value=accounting(c(15988.08, 1880.33, NA, 
                                    130.00, 97.05, 50.99)),
                 Change=percent(c(-0.0239, -0.0216, 0.021, 
                                  -0.0219, -0.0248, -0.0399)))
DF

formattable(DF, list(
  Name=formatter(
    "span",
    style = x ~ ifelse(x == "Technology", 
                       style(font.weight = "bold"), NA)),
  Value = color_tile("white", "orange"),
  Change = formatter(
    "span",
    style = x ~ style(color = ifelse(x < 0 , "red", "green")),
    x ~ icontext(ifelse(x < 0, "arrow-down", "arrow-up"), x)))
)