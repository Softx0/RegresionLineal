

Advertising <- read.csv("/Users/Mac/Desktop/UNIVERSIDAD/Autodidacta/AlgoritmosAvanzados/RegresionLineal/Resources/advertising.csv")
Advertising

plot(Advertising)
ModelAdvertising <- lm(Sales ~ Radio + TV + Newspaper, data = Advertising)


summary(ModelAdvertising)   


