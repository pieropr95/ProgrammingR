library(datasets)
data(iris)

head(iris)
mean(iris$Sepal.Length[iris$Species == 'virginica'])

apply(iris[,1:4],2,mean)

data(mtcars)

head(mtcars)
tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
with(mtcars, tapply(mpg,cyl,mean))

mean(mtcars$hp[mtcars$cyl == 8]) - mean(mtcars$hp[mtcars$cyl == 4])

