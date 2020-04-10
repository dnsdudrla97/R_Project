#dataframe 여러 자료형을 사용하여 2차원 구조로 된 자료구조

#3-8
city<-c("Seoul", "Naju", "Dong")
rank<-c(1,3,2)
city.info<-data.frame(city, rank)
city.info

#iris dataset
#3-9
iris[,c(1:2)]
iris[,c(1,3,5)]
iris[,c("Sepal.Length", "Species")]
iris[1:5,]
iris[1:5,c(1,3)]