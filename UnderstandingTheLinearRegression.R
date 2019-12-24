# En R utilizamos lm() para crear un modelo de regresion, para visualizar el modelo utilizamos la funcion summary() 
# Para analizar los residuos del modelo, podemos utilziar el comodin $ para referirnos a ellso, con $resid
# Los residuos son diferentes entre la prediccion y el resultado actual que te arroje, entonces se necesita nalizar esas
# diferencias para encontrar formas para mejorar el modelo de regresion que se ha creado, mantenerse en mejora continua



# Importamos el csv
dataset = read.csv("/Users/Mac/Desktop/UNIVERSIDAD/Autodidacta/Data/R/Regresion Lineal/Resources/data-marketing-budget-12mo.csv", 
                   header = T, colClasses = c("numeric", "numeric", "numeric"))

# Realizaremos la regresion linear de manera simple (una variable) y con multiples variables independientes.

#Con una variable
simple.fit = lm(Sales~Spend, data = dataset) #creamos el modelo
summary(simple.fit) # lo observamos

####### Podemos observar que lo hace en relacion con Spend, ya que fue la seleccionada, nos trae las secciones de residuales y
####### coeficientes

#Con dos variables
multi.fit = lm(Sales~ Spend + Month, data = dataset) # creacion del modelo
summary(multi.fit) # Observamos el modelo

####### Mientras que con este, nos trae datos en la seccion de coeficientes, de ambas variables
#### Porque no trae de mas de variables en la seccion residuals ? Hay que ver...

########## En otro sentido podemos observar que para ambos modelos, los resultados de la F-statistic, del Multiple E-square
########## del Adjusted R-squared  son muy similares, diciendonos, que son significativamente validos los modelos como lo indica
########## la referencia **, en los signif. codes.


layout(matrix(c(1,1,2,3),2,2,byrow=T))

<<<<<<< HEAD
# Pr(>|t|) 0.296 <- este es el nivel de significancia

# Residual standard error: es la desviacion estandar de los residuos, mas pequeño, mucho mejor

# Multiple R-squared: muestra la cantidad de varianza que existe explicada en el modelo

# Adjusted R-squared: este toma peso cuando hay muchas mas variables, para la regresion multiple, pero hace lo mismo que el normal

# F - statistic: es la prueba F, y verfica si el peso de al menos una variable es significativamente diferente de cero

# p - value: puede ser tomado tambien como un valor de significancia, si es menor a 0.05 el modelo esta bien, pero
          # si es mayor a 0.05, su modelo no esta haciendo nada.



layout(matrix(c(1,1,2,3),2,2,byrow=T))


#Spend x Residuals Plot
plot(simple.fit$resid~dataset$Spend[order(dataset$Spend)], main="Spend x Residuals\nfor Simple Regression",
      xlab="Marketing Spend", ylab="Residuals")

abline(h=0,lty=2)

#Histogram of Residuals
hist(simple.fit$resid, main="Histogram of Residuals", ylab="Residuals")

#Q-Q Plot
qqnorm(simple.fit$resid)
qqline(simple.fit$resid)


=======
#Spend x Residuals Plot
plot(simple.fit$resid~dataset$Spend[order(dataset$Spend)], main="Spend x Residuals\nfor Simple Regression",
     xlab="Marketing Spend", ylab="Residuals")

abline(h=0,lty=2)

#Histogram of Residuals
hist(simple.fit$resid, main="Histogram of Residuals", ylab="Residuals")

#Q-Q Plot
qqnorm(simple.fit$resid)
qqline(simple.fit$resid)
<<<<<<< HEAD
>>>>>>> develop
=======



>>>>>>> develop
