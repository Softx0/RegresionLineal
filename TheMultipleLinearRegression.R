
Advertising <- read.csv("/Users/Mac/Desktop/UNIVERSIDAD/Autodidacta/AlgoritmosAvanzados/RegresionLineal/Resources/advertising.csv")
Advertising

plot(Advertising)
ModelAdvertising <- lm(Sales ~ Radio + TV + Newspaper, data = Advertising)

summary(ModelAdvertising)   

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -7.3034 -0.8244 -0.0008  0.8976  3.7473 

# Valor minimo -7 valor maximo 3
# 
# 1Quartil, -0.82 osea el 25% de los datos esta por debajo de este
# entre el 2Q y el 3Q esta el 0 

# El Estimado o Estimate, nos dice en que cantidad aumenta dependiendo
# la unidad a la que este Y, si Y fuera centavos de dolar, por ej:
#   La Radio aumenta 0.10c la TV 0.054 y los Newspaper 0.0003
# Pero si Y estuviera en la magnitud de unidades vendidas ya seria 
# diferente, Eso es el Estimado

# Que conviene mas entonces ? la radio conviene mas

# Continuando con los coeficientes:
#   El Error estandar, el valor de t y el valor de p
# 
# Publicidad negativa seria, un caso donde haya error, 
# de la desviacion standard 
# Pues entonces si estuviera negativo alguna de las variables
# no es significativo a tomarse en cuenta para el analisis

# No aporta nada
# 
# Inlcuso podemos darnos cuenta mas rapido cuando, en los cod significativos
# este, de las opciones de 3 asteriscos, 2, 1, un dot (.) y nulo, entonces el
# newspaper es nulo

# Ahora bien proxima seccion
# 
# Residual standar error: mientras se reduce mas el error, entonces es mas
# preciso el modelo.

# El Coeficiente de Determiancion (R-squared): mientras mas cerca de 1 este 
# (que nunca va a ser asi).

# El Estadistico F, este mide la significancia global del modelo.
# Enlaza a la prueba de hipotesis, todos los beta son iguales a 0, o al menos hay 1 que no
# con la F-statistic se logra identificar.

# F- statistic debe ser mayor a 5, en este caso es muy bueno = 605.4
# Como modificaria a mi modelo sacar el newspaper

ModelAdvertising <- lm(Sales ~ Radio + TV, data = Advertising)
summary(ModelAdvertising)

plot(ModelAdvertising)









#####################################################################################################################################################################






#Ejemplo practico #2
#Lo que vamos a hacer es, intentar predecir el precio, segun el no. de baños, habitaciones y metros cuadrados.

attach(BD_casas) #Accede a las variables de la BD
BD_casas
pairs(BD_casas [, 3:6]) #Selecciona las variables (acotamos)
options(scipen = 999) #Quita la notacion cientifica | muy util


#Relacion entre las variables
#Matriz de correlacion entre tamaño y precio
cor(sqft_living, price)

#Covarianza entre precio y tamaño
cov(sqft_living, price)

#El test de correlacion de Pearson
cor.test(price, sqft_living) #Nos arroja un 70% de relacion entre estas variables
cor.test(price, bathrooms) #Un poco menos un 52%
cor.test(price, bedrooms) #Aqui ya es un poco bajo pero aun se puede tomar en cuenta, un 30%

# Nos da el valor de t
# El valor de significancia
# El valor de verdad de la hipotesis
# y la correlacion tambien



####                        ### 
###### CREACION DEL MODELO  ######
####                        ###



RM <- lm(price ~ bedrooms + bathrooms + sqft_living)
summary(RM)

# Entrando con contexto con el summary
# seccion de estimaciones, nos dice que los precios van a partir de 74,847, siendo este eje y de precio
# en la unidad de monedas.
# entonces teniendo a los baños, habs y mts cuadrados como factores para ser multiplicados estos,
# por la cantidad que tenga.
# 
# podemos observar que las habitaciones es de valor negativo, es decir si aumenta el no. de hab disminuye
# el precio O.o, extraño pero eso dice la data.

# En los valores de significacia como sabemos, mientras mas * tenga, mas relevante sera
# 
# El Coefiiciente de determinacion R^2, es del 50%, y el ajustado con un 50% por igual
# F-statistics, hace referencia a la anova, y que nos dice si el modelo explica mas de lo que no esta alli
# y tiene un buen valor.
# 
# y el valor de p, o coeficiente de significancia, que si es menor a 0.05 es bueno, este por lo tanto
# es excelente.


plot(RM)

# El primero es sobre la homocedasticidad de las varianzas
# residuos en y y valores en x, en la linea punteada esta el 0
# si es homogeneo, significa que los puntos por arriba de la linea
# y los que estan por debajo se podrian eliminar.
# 
# Hay valores atipicos, si aumenta el precio de lacasa aumenta el errorC
# Nuestro modelo no tiene homocedasticidad :/
#   
# En la proxima, es osbre la normal distribution, y pues esta
# dice que si los datos se mantienen enla linea punteada, seria
# una distribucion normal, pero cuando llega aprox. a 2, sube 
# repetinamente.

# otra forma de ver la distribucion normal del modelo es:

residuos <- residuals(RM)
hist(residuos) # como la mayoria se conservan con valores cercanos
# al cero, pues podemos decir que si tiene una dn

plot(residuos, bathrooms)

install.packages("lmtest")
library(lmtest)
require(lmtest)

#Durbin-Watson test
dwtest(RM)
# Si nuestro modelo esta entre 1.5 a 2.5 no hay problemas de
# autocorrelacion

#Coliniealidad, independencia entre las variables
#Que no esten linealmente independientes

install.packages("car")
library(car)
VIF (RM)












