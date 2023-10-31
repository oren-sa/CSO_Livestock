library(tidyr)
library(dplyr)
library(stringr)
library(raster)
library(rgdal)
library(sf)

setwd('..')
setwd("NDVI")
list.files()

crop_aoi<- function(x){terra::crop(x,aoi)}
aoi<-readOGR("AOI.gpkg")

s1<- paste0(year,'(031|032|033|041|042|043|051|052|053).tif')
s2<-paste0(year,'(101|102|103|111|112|113|121|122|123).tif')

read_season_crop<- function (x){
  ndvi_data<-readGDAL(x)
  ndvi_raster<-raster(ndvi_data)
  cropped_raster<-crop_aoi(ndvi_raster)
  return(cropped_raster)
}
year_list<- c("2007","2008","2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")
#write season 1 max rasters
for (year in year_list){
  pattern <- paste0(year, '(031|032|033|041|042|043|051|052|053).tif')
  ndvi_files <- list.files(pattern = pattern)
  ndvi_stack <- stack(lapply(ndvi_files, read_season_crop))
  max_ndvi <- calc(ndvi_stack, fun = max)
  writeRaster(max_ndvi, filename = paste0("max_ndvi_", year, "_s1",".tif"), format = "GTiff")
}
#write season 2 max rasters
for (year in year_list){
  pattern <- paste0(year,'(101|102|103|111|112|113|121|122|123).tif')
  ndvi_files <- list.files(pattern = pattern)
  ndvi_stack <- stack(lapply(ndvi_files, read_season_crop))
  max_ndvi <- calc(ndvi_stack, fun = max)
  writeRaster(max_ndvi, filename = paste0("max_ndvi_", year, "_s2",".tif"), format = "GTiff")
}
