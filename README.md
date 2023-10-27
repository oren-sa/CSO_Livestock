# CSO_Livestock
 Alex Orenstein, 2023
 Data and scripts for the CGIAR CSO LCSR dashboard

<b>ACLED data </b> <br>
This folder contains ACLED event data, including a filtered dataset (filtered for livestock-related conflicts) and a general one containing all ACLED events within the area of interest (AOI). The AOI used is stored within a GPKG file in the folder. To create the filtered data, the following strings were applied to the notes column of the ACLED data : 'CATTLE', 'ANIMAL','LIVESTOCK', 'CAMEL', 'HERD','SHEEP','GOAT','COW','RUSTL', 'PASTORAL', 'HERDER'.

The R script used to explore and filter the data is likewise within the folder.

<b>Landcover </b> <br>
This is a product derived from ESA/VITO's 10m Worldcover V200 product. It has been resampled to 100m to reduce the size of the files. Included in the drive are a style files for QGIS (QML), ESRI (LYR) and GeoServer/Mapserver (.SLD).

<b>Transhumance </b> <br>
