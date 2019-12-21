#La regresion lineal simple en R

#Datasource
grasas <- read.table("/Users/Mac/Desktop/UNIVERSIDAD/Autodidacta/AlgoritmosAvanzados/RegresionLineal/Resources/EdadPesoGrasas.txt", header = T)

#columnas que contiene
names(grasas)

#Que datos contienen
grasas

#Analisis exploratorio mediante la correlacion de las variables, en este caso son 3
cor(grasas)

# Podemos observar que:
#   1. La edad con el peso tienen una relacion pobre de 24%
#   2. La grasa corporal con el peso por igual un 26%
#   3. Pero La Grasa con la edad tienen un 83% de correlacion

#Graficamente
pairs(grasas)

#lineal model, vamos a crear el modelo de regresion lineal
#Regresion lineal simple = una ecuacion de prediccion
regresion <- lm(grasas ~ edad, data = grasas)

#Observamos el modelo
summary(regresion)

# El intercepto(intercept) y la pendiente
# El intercepto tiene una significancia del 99%
# La pendiente (edad) aun mas significativo el 99.9%

#Es primordial, ya que nos ofrece una pauta para continuar con nuestro analisis
#Tambien observamos el R-square que es de un 70%, tambien llamado el Coeficiente de determinacion
#Quiere decir que la variabilidad entre Y y X (Grasa y Edad), es menor, es bueno y nos damos cuenta
# con esto de que los puntos no distan mucho de la linea de regresion sin haberla creado ya.

#Tambien podemos realizar un analisis ANOVA, el Analysis of the Variance
#Esto nos da la BONDAD DE AJUSTE, si es significativa, se puede tener seguridad de que los datos son buenos usables
#Para la prediccion
anova(regresion)

#Si es significativa, la Hipotesis nula H0, se rechaza y la Alternativa se acoge H1 como cierta
#Que hay una correlacion diferente de cero


#Grafico de dispersion
plot(grasas$edad, grasas$grasas, xlab = "Edad", ylab = "Grasas")

#la recta correspondiente a la funcion de dicha grafico
abline(regresion)

#Se nota una correlacion positiva, pero hay un 30% que no esta siendo explicado por este modelo, por el 70% del R^2 






#Los supuestos del del modelo
par(mfrow = c(2,2)) #mf row y el vector 2,2 nos pone los graficos en 2 columnas y 2 filas
plot(lm(grasas ~ edad, data = grasas))

# En orden:
#   1. El de aleatoriedad
#   2. Distribucion normal
#   3. Homocedasticidad
#   4. Cuando un valor es extremo que puede influenciar en la correlacion

#Residuals vs Fitted, si tengo aleatoriedad en mi modelo, que deben cumplirse en el modelo, es decir la muestra debe ser aleatoria

#Si cumple con el supuesto de la Distribucion Normal, veamos que aparecen 3 datos especificos (los nmeros son el index), 
#lo que busca esta grafica es, que los datos se ajusten lo mayor posible a la linea imaginaria que se presenta. Como vemos estan muy bien.

#Scale - Location
#Muestra la Homocedasticidad, se espera ver, que exista una tendencia, lineal o no, como es aleatorio, no es muy definida la tendencia o el patron
#Pero un analisis con datos numericos seria mas clarificador o sino lo estariamos violando el supuesto

#La Transformacion de Cook, esperamos que todos los valores en la escala presentada, en la linea imagiinaria dibujada, esten todos los valores aqui
#Esos datos son influyentes en el resultado de la ecuacion de prediccion.






####################################################################






#La ecuacion que se nos genera en el modelo, sabemos que se usa para predecir
#Entonces podemos jugar con ella e insertarle valores
#Como observamos en el word de introduccion a la regresion lineal, hay 2 metodos
# para que se haga la recta en el modelo, minimo cuadrados ordinario y el descenso del gradiente
# R lo hace solo, el minimo cuadrado ordinario, pues entonces meteremos valores para que sean predichos

#Creamos un par de nuevos datos
nuevas.edades <- data.frame(edad = seq(30,35)); nuevas.edades

#Y usamos el metodo predict para cumplir como los mejores, dicho mandato, predecir
#Pasamos el modelo hecho y los nuevos datos
predict(regresion, nuevas.edades)

#Entonces, nos arroja inmediatamente, el resultado, siendo el mismo
#para cada edad entrada, esta se proceso en el modelo y nos dio la grasa corporal

#Ahora bien se puede observar desde una mejor precision, con los valores minimos y maximos, ya que el que nos arroja es promedio
#Esta precision sera de un 95%
predict(regresion, data.frame(nuevas.edades), level = 0.95, interval = "confidence")

#fit el valor ya antes arrojado
#lwr el minimo
#upr el maximo

#Porque el primero su min es 239 y su max es 284 con una diferencia 
#promedia en todos de 40 a 45 mas o menos

#Tambien podemos obtener de DONDE A DONDE esta variando el intercepto y como es la pendiente (m)
confint(regresion, level = 0.95)

# Basicamente lo que le estamos pasando un factor alfa, como si fuera el metodo de el descenso del gradiente
# ya vimos con un 95%, ahora que tal con un 99%, recordando que alfa es el Ratio de Aprendizaje
  
confint(regresion, level = 0.99)  

#El LEVEL ES ALFA EL RATIO DE APRENDIZAJE


#Graficamos
plot(grasas$edad, grasas$grasas, xlab = "Edad", ylab = "Grasa Corporal")
abline(regresion)

# Vamos a generar los intervalos de confianza para ver si tenemos datos anomalos que me dañen el mnodelo

#Ahora meteremos simplemente un vector indicativo de donde a donde varian los datos.
#Y los intervalos de confianza de prediccion
nuevas.edades <- data.frame(edad = seq(20, 60))
intervalo.confianza <- predict(regresion, nuevas.edades, interval = "confidence")

#Aqui ya estamos tirando el intervalo de confianza
lines(nuevas.edades$edad, intervalo.confianza[, 2], lty = 5, col = "blue") #dice 2 porque esta sera la linea 2, la 1 ya es la principal

lines(nuevas.edades$edad, intervalo.confianza[, 3], lty = 5, col = "blue")


#Los Limites de Prediccion tambien son a tomar en cuenta, son los valores en el que se producira una observacion
#futura con determinada probabildiad.

#Intervalo de Confianza, son varios pares de numeros entre los cuales se estima que estara cierto
#valor desconocido con un determinado nivel de confianza.

ip <- predict(regresion, nuevas.edades, interval = "prediction")
lines(nuevas.edades$edad, ip[, 2], lty = 2, col = "red")
lines(nuevas.edades$edad, ip[, 3], lty = 2, col = "red")


#Otros analisis para valores numericos

#Outliers -- QQ -- Plots
library(carData)
library(car)
outlierTest(regresion) #Outlier-BonferonnieTest

















