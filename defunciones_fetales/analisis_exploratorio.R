library(haven)
library(foreign)
library(dplyr)
library(nortest)
setwd("D:/AxelFolder/University/mineria_de_datos/ProyectoDataMining/defunciones_fetales")

#Obteniendo datasets
DefFet2009 <- read_sav("defuncionesFetales2009.sav")
DefFet2010 <- read_sav("defuncionesFetales2010.sav")  
DefFet2011 <- read_sav("defuncionesFetales2011.sav")  
DefFet2012 <- read_sav("defuncionesFetales2012.sav")  
DefFet2013 <- read_sav("defuncionesFetales2013.sav")
DefFet2014 <- read_sav("defuncionesFetales2014.sav")
DefFet2015 <- read_sav("defuncionesFetales2015.sav")
DefFet2016 <- read_sav("defuncionesFetales2016.sav")
DefFet2017 <- read_sav("defuncionesFetales2017.sav")
DefFet2018 <- read_sav("defuncionesFetales2018.sav")
DefFet2019 <- read_sav("defuncionesFetales2019.sav")

#Removiendo labels/descripción
DefFet2009 <- zap_labels(DefFet2009)
DefFet2010 <- zap_labels(DefFet2010)
DefFet2011 <- zap_labels(DefFet2011)
DefFet2012 <- zap_labels(DefFet2012)
DefFet2013 <- zap_labels(DefFet2013)
DefFet2014 <- zap_labels(DefFet2014)
DefFet2015 <- zap_labels(DefFet2015)
DefFet2016 <- zap_labels(DefFet2016)
DefFet2017 <- zap_labels(DefFet2017)
DefFet2018 <- zap_labels(DefFet2018)
DefFet2019 <- zap_labels(DefFet2019)

#Uniendo datasets y agregando columnas
DefFet2009_2011 <- rbind(DefFet2009, DefFet2010, DefFet2011)
DefFet2009_2011$GRETNM <- NA
DefFet2009_2011$OCUPAM <- NA

DefFet2012_2019 <- rbind(DefFet2012, DefFet2013, DefFet2014, DefFet2015, DefFet2016, DefFet2017, DefFet2018, DefFet2019)
DefFet2012_2019$PUEBLOPM <- NA
DefFet2012_2019$AÑOOCU <- NA
DefFet2012_2019$CIUOMAD <- NA
names(DefFet2012_2019)[names(DefFet2012_2019)=="NACIOM"] <- "NACIONM"

DefFet2012_2019[, c("DEPREG", "MUPREG", "MESREG", "AÑOREG", "DEPOCU", "MUPOCU", "AREAG", "SEXO", "DIAOCU", "MESOCU", "AÑOOCU", "TIPAR", "CLAPAR", "VIAPAR", "SEMGES", "EDADM", "PAISREM", "DEPREM", "MUPREM", "PUEBLOPM", "ESCIVM", "NACIONM", "ESCOLAM", "CIUOMAD", "CAUDEF", "ASISREC", "SITIOOCU", "TOHITE", "TOHINM", "TOHIVI", "GRETNM")]

DefFet2009_2019 <- rbind(DefFet2009_2011, DefFet2012_2019)

#Exportar como Excel
write.csv(DefFet2009_2019,"defunciones_fetales.csv",row.names = FALSE)

#Comportamientos
depreg <- table(DefFet2009_2019$DEPREG)
barplot(depreg, xlab = 'Frecuencia', main = 'Departamento de registro', col=rainbow(22))

mupreg <- table(DefFet2009_2019$MUPREG)
barplot(mupreg, xlab = 'Frecuencia', main = 'Municipio de registro', col=rainbow(2217))

mesreg <- table(DefFet2009_2019$MESREG)
barplot(mesreg, xlab = 'Frecuencia', main = 'Mes de registro', col=rainbow(12))

anioreg <- table(DefFet2009_2019$AÑOREG)
barplot(anioreg, xlab = 'Frecuencia', main = 'Año de registro', col=rainbow(10))

hist(DefFet2009_2019$DEPREG,
     main = "Cantidad de madres por departamentos",
     xlab = "Departamento",
     breaks = 50)


