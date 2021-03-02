library(haven)
library(foreign)
library(dplyr)
setwd("C:/Users/LENOVO/Desktop/Clases/Minería de datos/HT2/ProyectoDataMining/defunciones")

Def2009 <- read_sav("defunciones2009.sav")
Def2010<- read_sav("defunciones2010.sav")
Def2011 <- read_sav("defunciones2011.sav")
Def2012 <- read_sav("defunciones2012.sav")
Def2013 <- read_sav("defunciones2013.sav")
Def2014 <- read_sav("defunciones2014.sav")
Def2015 <- read_sav("defunciones2015.sav")
Def2016 <- read_sav("defunciones2016.sav")
Def2017 <- read_sav("defunciones2017.sav")
Def2018 <- read_sav("defunciones2018.sav")
Def2019 <- read_sav("defunciones2019.sav")
# Definiendo minúsculas
names(Def2009) <- tolower(names(Def2009))
names(Def2010)<- tolower(names(Def2010))
names(Def2011)<- tolower(names(Def2011))
names(Def2012)<- tolower(names(Def2012))
names(Def2013)<- tolower(names(Def2013))
names(Def2014)<- tolower(names(Def2014))
names(Def2015)<- tolower(names(Def2015))
names(Def2016)<- tolower(names(Def2016))
names(Def2017)<- tolower(names(Def2017))
names(Def2018)<- tolower(names(Def2018))
names(Def2019)<- tolower(names(Def2019))


## agrregando añoocu a  las bases que le faltan 
Def2009$escodif <- NA

Def2012$añoocu <-2012
Def2013$añoocu <- 2013
Def2013$ciuodif <- NA
names(Def2013)[names(Def2013)=="getdif"]<- "puedif"

Def2014$añoocu <- 2014
Def2015$añoocu <-2015

# Quitando descripción
Def2009z<-zap_labels(Def2009)
Def2010z<-zap_labels(Def2010)
Def2011z<-zap_labels(Def2011)
Def2012z<-zap_labels(Def2012)
Def2013z<-zap_labels(Def2013)
Def2014z<-zap_labels(Def2014)
Def2015z<-zap_labels(Def2015)
Def2016z<-zap_labels(Def2016)
Def2017z<-zap_labels(Def2017)
Def2018z<-zap_labels(Def2018)
Def2019z<-zap_labels(Def2019)

## Preparando para concatenar 2009-2013

Def09_12 <-rbind(Def2009z,Def2010z,Def2011z)
Def09_12$pnadif <- NA
Def09_12$predif <- NA
Def09_12 <- rbind(Def09_12,Def2012z)
names(Def09_12)[names(Def09_12)=="getdif"]<- "puedif"
Def09_12$ocudif <- NA

Def09_13 <-rbind(Def09_12,Def2013z)
## Concatenando 2014-2019

Def15_19 <- rbind(Def2014z,Def2015z)
Def15_19 <- rbind(Def15_19,Def2016z,Def2017z)
Def15_19 <- rbind(Def15_19,Def2018z,Def2019z)

## Concantenando 2009-2013 y 2014-2019
Def15_19$ocudif <- NA
Defunciones <- rbind(Def09_13,Def15_19)

##
write.csv(Defunciones,"Defunciones.csv",row.names = FALSE
