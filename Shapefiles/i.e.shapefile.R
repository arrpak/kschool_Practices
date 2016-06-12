### MAPS AND SHAPEFILES. 

#READ LIBRARIES
library(rgdal)
library(ggplot2)
library(RColorBrewer)

#READ TABLE
censo_can <- read.table(file = "Censo_canino.csv", header = TRUE, sep = ";")
censo_can$ESPECIE.CANINA <- as.numeric(censo_can$ESPECIE.CANINA)

#READ SHAPFILE
distritos <- readOGR(dsn = "DISTRITOS", "DISTRITOS" )

#COMBINE SHAPEFILE AND DATA
distritos@data <- merge(distritos@data, censo_can, by.x="CODDISTRIT", by.y="CODDISTRIC")

#INSPECT DATA
slotNames(distritos)
distritos@data

#PLOT DATA
#Basic way
plot(distritos, col = distritos$ESPECIE.FELINA)
#Using tmap libray
library(tmap) # load tmap package (see Section IV)
qtm(distritos, "ESPECIE.FELINA") 


