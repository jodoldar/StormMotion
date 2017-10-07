# StormMotion
A project of storm movement predictions

Con este proyecto se busca poder identificar células tormentosas e intentar predecir el movimiento que van a seguir teniendo en cuenta tanto sus posiciones anteriores como un conjunto de datos coleccionado previamente que actua como base de entrenamiento, el cual se va actualizando periodicamente a partir de las últimas observaciones efectuadas.

El ámbito de predicción actual se centra exclusivamente a la Comunidad Valenciana, España, pudiendo ser en todo caso, en el momento en el que la aplicacion sea autonoma, ser extendible a cualquier otro territorio.

Todas las imagenes usadas en este proyecto se obtienen de [AEMET](http://www.aemet.es/es)
```
Estructura del proyecto:
|                        -> Archivos principales del proyecto
├ \OCR                   -> Conjunto de imagenes para obtener el alfabeto de números mediante OCR
├ \Ruby_image_get        -> Scripts para descargar el contenido de la AEMET
|    └ \ruby_images      -> Imagenes descargadas
├ \Time\tessdata         -> Contiene el clasificador para los caracteres numericos de las imagenes
├ \data                  -> Archivos auxiliares para el clasificador OCR
├ \functions             -> Funciones auxiliares para el conjunto de la aplicación
├ \image_characteristics -> Caracteristicas significativas de las imagenes obtenidas
└ \images                -> Imagenes a utilizar en el proyecto, ya tratadas.
```
----
The purpose of this project is to identify storm cells and try to predict their movement taking into account their previous positions and a previously collected data set used as a training set, which is updated periodically from the most recent observations.

The scope of the current predictions is exclusively focused in Comunidad Valenciana, Spain. This scope may be modified when the application becomes stand-alone, being changed to other territories.

All the used images in the project are from [AEMET](http://www.aemet.es/es)
