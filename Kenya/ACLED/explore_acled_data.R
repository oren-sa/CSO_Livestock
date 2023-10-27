library(rgdal)
library(sf)
library(stringr)

list.files()
acled_all<-read.csv("East_Africa_ACLED_WHOLE.csv") #Path to your ACLED dataset here
aoi<- st_as_sf(readOGR("AOI.gpkg"))

#reduce to AOI
acled <- st_as_sf(acled_all, coords = c("longitude", "latitude"))
acled <- st_set_crs(acled,4326)
acled <- st_intersection(acled, aoi)

acled$notes<- toupper(acled$notes)
acled$actor1<-toupper(acled$actor1)
acled$actor2<-toupper(acled$actor2)
acled$assoc_actor_1 <- toupper(acled$assoc_actor_1)
acled$assoc_actor_2 <- toupper(acled$assoc_actor_2)


patterns <- c('CATTLE', 'ANIMAL','LIVESTOCK', 'CAMEL', 'HERD','SHEEP','GOAT','COW','RUSTL', 'PASTORAL', 'HERDER')
actor_patterns<- c('PASTORAL')
acled_filter<- subset(acled, grepl(paste(patterns, collapse='|'), acled$notes) |
                                  grepl(paste(actor_patterns, collapse='|'), acled$assoc_actor_2 ) | 
                                  grepl(paste(actor_patterns, collapse='|'), acled$assoc_actor_1 )) 
acled_filter <- st_as_sf(acled_filter, coords = "geometry")
acled_filter <- st_set_crs(acled_filter,4326)    

#visualize the differences between filtered data and unfiltered data
hist(acled_filter$year)
hist(acled$year)
                                 
write.csv(acled_filter,"acled_filtered.csv")
st_write(acled_filter,"acled_filtered.gpkg", driver="GPKG")

