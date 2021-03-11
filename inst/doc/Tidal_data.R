## ---- echo = FALSE, message=FALSE, warning=FALSE, results = "hide", fig.width=7, fig.height=4----
library(VulnToolkit)

HL.NL <- HL(level = NL_6min_2013[,2], time = NL_6min_2013[,1])
head(HL.NL)

### plot the data to visually assess the high/low tides
### this is a long time series, so we'll narrow the time window
NL.sub  <- NL_6min_2013[NL_6min_2013$`time_GMT` < "2013-03-15", ]
HL.plot(level = NL.sub[,2], time = NL.sub[,1])



## ---- message=FALSE, warning=FALSE, results = "hide", fig.width=6, fig.height=4----
nos <- number.tides(data = NL_6min_2013, datetime = NL_6min_2013[,1], hl = HL.NL)




## ---- message=FALSE, warning=FALSE, fig.width=6, fig.height=4-----------------

# show how flooding frequency changes with elevation
elevs     <- data.frame(elev = seq(from = 0, to = 1.5, by = 0.005))
elevs$frq <- fld.frq(z = elevs$elev, 
                     ht = HL.NL$level[HL.NL$tide == "H"])

plot(elev ~ frq, data = elevs, pch = 19, cex = 0.6, las = 1, type = "l",
     xlab = "flooding frequency (% of tides)",
     ylab = "elevation (m)")

# Let's look more closely at an elevation of interest: mean high water
MHW <- mean(HL.NL$level[HL.NL$tide == "H"])
abline(h = MHW, lty = 2) # add MHW line to plot


# number of flooding tides at MHW
fld.frq(z = MHW, ht = HL.NL$level[HL.NL$tide == "H"], units = "tides") 
# flooding tides as a proportion of all tides in dataset
fld.frq(z = MHW, ht = HL.NL$level[HL.NL$tide == "H"], units = "percent")  




## ---- message=FALSE, warning=FALSE, results = "hide", fig.width=6, fig.height=4----
elevs$median.depth <- fld.depth(elevation = elevs$elev,
                     level = NL_6min_2013[, 2])
plot(elevs$elev ~ 
       elevs$median.depth , 
     pch = 19, cex = 0.6, las = 1, type = "l", 
     xlab = "median flooding depth (m)",
     ylab = "elevation (m)")
abline(h = MHW, lty = 2) # line indicates MHW


## ---- message=FALSE, warning=FALSE, results = "hide", fig.width=6, fig.height=4----
elevs$events <- dur.events(elevation = elevs$elev, 
                     level = NL_6min_2013[, 2])
plot(elevs$elev[!is.na(elevs$events)] ~ 
       I(log(elevs$events[!is.na(elevs$events)])) , 
     pch = 19, cex = 0.6, las = 1, type = "l", 
     xlab = "median flooding event (hours; log scale)",
     ylab = "elevation (m)")
abline(h = MHW, lty = 2) # line indicates MHW


