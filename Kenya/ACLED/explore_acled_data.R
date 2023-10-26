library(rgdal)
library(sf)
library(stringr)

list.files()
acled_all<-read.csv("East_Africa_ACLED_WHOLE.csv")
aoi<- st_as_sf(readOGR("AOI.gpkg"))

unique(acled_all$country)

colnames(acled_all)
colnames(acled)
#reduce to AOI
acled <- st_as_sf(acled_all, coords = c("longitude", "latitude"))
acled <- st_set_crs(acled,4326)
acled <- st_intersection(acled, aoi)

#acled<- merge (acled, acled_all[ , c("longitude","latitude")], by = "event_id_cnty")
#acled$FID <- seq_along(acled$FID)

#reattach lat/lon (they get lost in the st_as_sf)

#write.csv(acled,"acled_aoi_unfiltered.csv")

#acled<- subset(acled, acled$year > 2010)

unique(acled$actor1)

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

hist(acled_filter$year)
hist(acled$year)                                 
write.csv(acled_filter,"acled_filtered.csv")
st_write(acled_filter,"acled_filtered.gpkg", driver="GPKG")
#writeOGR(acled_filter,"acled_filtered", driver="GPKG")
