# CSO_Livestock
 Alex Orenstein, 2023
 Data and scripts for the CGIAR CSO LCSR dashboard

<b>ACLED data </b> <br>
This folder contains ACLED event data, including a filtered dataset (filtered for livestock-related conflicts) and a general one containing all ACLED events within the area of interest (AOI). The AOI used is stored within a GPKG file in the folder. To create the filtered data, the following strings were applied to the notes column of the ACLED data : 'CATTLE', 'ANIMAL','LIVESTOCK', 'CAMEL', 'HERD','SHEEP','GOAT','COW','RUSTL', 'PASTORAL', 'HERDER'.

The R script used to explore and filter the data is likewise within the folder.

<b>Landcover </b> <br>
This is a product derived from ESA/VITO's 10m Worldcover V200 product. It has been resampled to 100m to reduce the size of the files. Included in the drive are a style files for QGIS (QML), ESRI (LYR) and GeoServer/Mapserver (.SLD).

<b>Transhumance </b> <br>
This folder contains a geojson and geopackage of the transhumance route data, sourced from ILRI's participatory research. The "Class" column indicates the type of road. Styling should be based on this column. It may be preferable to exclude non-functional rotues from any visualization.

<b>Seasonal data </b> <br>
The seasonal data includes rainfall (CHIRPS) and NDVI (Meteosat) totals for each season from 2008 to 2023. Season 1 (S1) corresponds to the Kenyan short rains (Mar 01 to May 31) and season 2 (S2) to the long rains (Oct 01 to Dec 31). Dekadal files (one image for every 10 days) are also included in each repository.

<b>Seasonal NDVI </b> <br>
This folder contains seasonal NDVI files, indicating the peak/maximum dekadal NDVI value for each season. The dekadal files are cropped to the area of interest (Kenya) to save space. Please contact for access to the continent-wide files. 

The dekadal files are named by year, month and dekad in YYYYMMD format: for instance "cropped_NDVI_2008031.tif" is a cropped dekadal NDVI file from the first dekad of March (March 01-10) of 2008.

The seasonal files are named by year and season in YYYY_SS format: for instance "max_ndvi_2008_s1.tif" is the maximum ndvi from season 1 (Mar 01 to May 31) of 2008<br>

The data are 10-daily images from EUMETSAT/Metosat-9: https://navigator.eumetsat.int/product/EO:EUM:DAT:MSG:NDVI-IODC

Data source: Hoefsloot Spatial Solutions (www.hoefsloot.com)

<b>Seasonal rainfall </b> <br>
This folder contains seasonal rainfall files, which contain the cumulative rainfall for each season. The dekadal files cover the African continent. The dekadal files are in year, month, dekad (YYYY_M_D) format: for instance : "Rain_2007_1_2.tif" corresponds to the second dekad of January (Jan 10-20) of 2007.

The seasonal files are named in YYYY_SS format, for instance "sum_rain_2009_s1.tif" contains the cumulative rainfall of the first season (Mar 01-May 31) of 2009.
The data are 10-daily images from CHIRPS https://www.chc.ucsb.edu/data/chirps

Data Source: Hoefsloot Spatial Solutions (www.hoefsloot.com) 
