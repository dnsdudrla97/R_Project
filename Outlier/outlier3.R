## 데이터 분리, 선택
# - 하나의 데이터셋을 열의 값을 기준으로 여러 개의 데이터셋으로 분리 : split()
# - 데이터셋으로부터 조건에 맞는 행 들 추출 : subset()

# 데이터 분리
sp<-split(iris, iris$Species)       # 품종별로 데이터 분리
sp                                      
summary(sp)                         # 분리 결과 요약
sp$setosa

# 데이터 선택
subset(iris, Species == "setosa")
subset(iris, Sepal.Length > 7.5)
subset(iris, Sepal.Length > 5.1 & Sepal.Width > 3.9)

subset(iris, Sepal.Length > 7.6, select=c(Petal.Length, Petal.Width))
subset(iris, Sepal.Length > 7.6)[,c('Petal.Length', 'Petal.Width')]

