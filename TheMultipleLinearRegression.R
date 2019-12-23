

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






