##Geografope=group
##Creación de mapa web=name
##Ingrese_tu_capa_vectorial=vector
##Tipo_de_base_map=selection OpenStreetMap;Satelital
##Elija_el_campo_para_el_popup=Field Ingrese_tu_capa_vectorial
##Formato_de_salida=output html
library(leaflet)
library(htmlwidgets)
Layer = Ingrese_tu_capa_vectorial
if(Tipo_de_base_map == 0){
    m <- Layer |> 
    leaflet() |> 
    addTiles() |> 
    addMarkers(label = paste0("Dato: ",Layer[[Elija_el_campo_para_el_popup]]))
    saveWidget(m,Formato_de_salida, selfcontained = FALSE)
} else if (Tipo_de_base_map == 1){
    m <- Layer |> 
    leaflet() |> 
    addProviderTiles(provider = 'Esri.WorldImagery',options = leafletOptions(maxZoom = 17)) |> 
    addMarkers(label = paste0("Dato: ",Layer[[Elija_el_campo_para_el_popup]]))
    saveWidget(m,Formato_de_salida, selfcontained = FALSE)
}