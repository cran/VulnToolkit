## ---- echo = FALSE, message=FALSE, warning=FALSE, results = "hide", eval=FALSE----
#  library(VulnToolkit)
#  
#  ### 6-minute data
#  NL2013 <- noaa(begindate = 20130101, enddate = 20131231,
#    station = "8461490", interval = "6 minute",
#    units = "meters", datum = "MHW", time = "GMT")
#  
#  ### high/low tides
#  NL2013_HL <- noaa(begindate = 20130101, enddate = 20131231,
#    station = "8461490", interval = "HL",
#    units = "meters", datum = "MHW", time = "GMT")
#  
#  
#  ### multiple stations can be downloaded at the same time using lapply:
#  stns <- c("8461490", "8518750")
#  ### output is a list with an element for each station
#  datList <- lapply(X = stns, FUN = noaa,
#            begindate = 20130101, enddate = 20131231, interval = "6 minute",
#            units = "meters", datum = "MHW", time = "LST")
#  
#  

## ---- echo = FALSE, include = FALSE-------------------------------------------
library(VulnToolkit)
NL2013 <- NL_6min_2013

## ---- eval=FALSE--------------------------------------------------------------
#  
#  bport.datums   <- noaa.datums(station = 8461490) # New London, CT
#  battery.datums <- noaa.datums(station = 8518750) # Battery, NYC
#  
#  ### retrieve harmonic constituents
#  bport.cons <- harcon(station = 8461490) # New London, CT
#  bport.cons
#  
#  ### calculate form number
#  formDat  <- form.no(station = 8461490) # New London, CT
#  ### Multiple stations at once:
#  stn.list <- c("8467150", "8461490", "9454240")
#  formDat2 <- form.no(stn.list)
#  

## ---- eval = FALSE------------------------------------------------------------
#  psmsl.stns <- psmsl.stations(country = "USA", sort.by = "name")
#  
#  ### using the psmsl.stations call to define stations
#  data.v1 <- psmsl(station = psmsl.stns[c(42, 70), 1])
#  
#  ### call stations by name or ID
#  data.v2 <- psmsl(station = c("DEPOE BAY", "JUNEAU"), interval = "monthly")
#  data.v3 <- psmsl(station = c(1372, 12), interval = "monthly")
#  data.v4 <- psmsl(station = c("DEPOE BAY", 12), interval = "monthly")
#  
#  

