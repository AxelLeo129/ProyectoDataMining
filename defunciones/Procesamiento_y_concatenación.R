library(haven)
library(foreign)
library(dplyr)
setwd("C:/Users/LENOVO/Desktop/Clases/Miner�a de datos/Github/ProyectoDataMining/defunciones")

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
# Definiendo min�sculas

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
## Definiendo mismo sistema de fechas

Def2009$a�oreg<- 09
Def2009$a�oocu <- 09

Def2010$a�oreg <- 10
Def2010$a�oocu <-10

Def2011$a�oreg<- 11
Def2011$a�oocu <- 11

Def2012$a�oreg <- 12
Def2012$a�oocu <-12

Def2013$a�oreg<- 13
Def2013$a�oocu <- 13

Def2014$a�oreg <- 14
Def2014$a�oocu <-14

Def2015$a�oreg<- 15
Def2015$a�oocu <- 15

Def2016$a�oreg <- 16
Def2016$a�oocu <-16

Def2017$a�oreg<- 17
Def2017$a�oocu <- 17

Def2018$a�oreg <- 18
Def2018$a�oocu <-18

Def2019$a�oreg<- 19
Def2019$a�oocu <- 19



## agrregando a�oocu a  las bases que le faltan 

Def2009$escodif <- NA

Def2013$ocudif <- NA

names(Def2013)[names(Def2013)=="getdif"]<- "puedif"



# Quitando descripci�n

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
Def09_12$ciuodif <- NA
Def2013z$caudef.descrip <- NULL
Def09_13 <-rbind(Def09_12,Def2013z)
## Concatenando 2014-2019

Def15_19 <- rbind(Def2014z,Def2015z)
Def15_19 <- rbind(Def15_19,Def2016z,Def2017z)
Def2019z$areag <-NA
Def2018z$areag <-NA
Def15_19 <- rbind(Def15_19,Def2018z,Def2019z)

## Concantenando 2009-2013 y 2014-2019

Def15_19$ocudif <- NA
Defunciones <- rbind(Def09_13,Def15_19)

##
write.csv(Defunciones,"Defunciones.csv",row.names = FALSE)

