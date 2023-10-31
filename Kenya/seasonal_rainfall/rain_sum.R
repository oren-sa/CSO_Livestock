library(tidyr)
library(dplyr)
library(stringr)
library(raster)
library(rgdal)
library(sf)

setwd("..")
setwd("Rain")
list.files()
crop_aoi<- function(x){terra::crop(x,aoi)}
aoi<-readOGR("AOI.gpkg")

s1<- paste0(year,'(_3_1|_3_2|_3_3|_4_1|_4_2|_4_3|_5_1|_5_2|_5_3).tif'))
s2<-paste0(year,'(101|102|103|111|112|113|121|122|123).tif')
list.files(pattern= paste0(year, s1))

read_season_crop<- function (x){
  ndvi_data<-readGDAL(x)
  ndvi_raster<-raster(ndvi_data)
  cropped_raster<-crop_aoi(ndvi_raster)
  return(cropped_raster)
}
year_list<- c("2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")

#write season 1 max rasters
for (year in year_list){
  pattern <- paste0(year,'(_3_1|_3_2|_3_3|_4_1|_4_2|_4_3|_5_1|_5_2|_5_3).tif')
  rain_files <- list.files(pattern = pattern)
  rain_stack <- stack(lapply(rain_files, read_season_crop))
  sum_rain<- calc(rain_stack, fun = sum)
  writeRaster(sum_rain, filename = paste0("sum_rain_", year, "_s1",".tif"), format = "GTiff")
}