Advertising <- read.csv("/Users/Mac/Desktop/UNIVERSIDAD/Autodidacta/AlgoritmosAvanzados/RegresionLineal/Resources/advertising.csv")

Advertising

cor(Advertising)
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





