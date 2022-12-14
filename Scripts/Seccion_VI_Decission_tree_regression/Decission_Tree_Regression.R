#Árbol de decisión para regresión

#Importo el dataset
dataset = read.csv("Position_Salaries.csv")
dataset =dataset[, 2:3]

#Division de los datos para la fase de entrenamiento y para la fase de testing
# install.packages("caTools")
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Purchased, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# testing_set = subset(dataset, split == FALSE)


# Creacion (Ajuste) del Modelo de Regresión con el Conjunto de Datos
library(rpart)
regression = rpart(formula = Salary ~ .,
                   data = dataset,
                   control = rpart.control(minsplit = 1))


# Predicción de nuevos resultados con Regresión
y_pred= predict(regression, newdata = data.frame(Level = 6.5))


# Visualización del modelo de árbol de regresión

# install.packages("ggplot2")
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             color = "red") +
  geom_line(aes(x = x_grid, y = predict(regression, 
                                        newdata = data.frame(Level = x_grid))),
            color = "blue") +
  ggtitle("Predicción (modelo de árbol de regresion)") +
  xlab("Nivel del empleado") +
  ylab("Sueldo (en $)")
