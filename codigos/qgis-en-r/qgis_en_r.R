library(qgisprocess)
library(sf)
library(terra)

# 1. Trabajando con datos raster ------------------------------------------
# Cálculo del índice de humedad topográfica (TWI)
dem <- rast('../data/dem.tif')
fun_twi <- qgis_function(algorithm = "sagang:sagawetnessindex")
twi <- fun_twi(DEM = dem,TWI = 'twi.sdat') |> 
  qgis_extract_output('TWI') |> 
  qgis_as_terra()

# Visualización del índice de humedad topográfica
twi |>
  plot(col = cptcity::cpt('ocal_blues',5,rev = -1))

# 2. Trabajando con datos vectoriales -------------------------------------
# Análisis de redes
pto <- st_read('../data/puntos.gpkg')
red <- st_read('../data/redes.gpkg')

ruta_corta <- qgis_function(algorithm = "native:shortestpathpointtopoint")

ruta_corta(
  INPUT = red,
  START_POINT = '-71.574229,-13.516067 [EPSG:4326]' ,
  END_POINT = '-71.572639,-13.517401 [EPSG:4326]',
  PROJECT_PATH = 'analisis_de_redes.qgz') |> 
  qgis_extract_output(name = 'OUTPUT') |> 
  st_read() |> 
  plot()