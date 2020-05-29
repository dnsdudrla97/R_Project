# 데이터 정렬
## 벡터의 정렬
v1<-c(1,7,6,8,4,2,3)
order(v1)
v1<-sort(v1)
v1
v2<-sort(v1, T)
v2

## 데이터 프레임 정렬
head(iris)
# order() 함수는 주어진 열의 값들에 대해 순서를 붙인다.
# 값의 크기를 기준으로 작은 값부터 시작해서 번호를 붙인다.
order(iris$Sepal.Length)            # 순서 번호 정렬
iris[order(iris$Sepal.Length),]     # 오름 차순 정렬
iris[order(iris$Sepal.Length, decreasing=T),]       # 내림 차순
iris.new<-iris[order(iris$Sepal.Length),]       # 정렬된 데이터를 저장
head(iris.new)
iris[order(iris$Species, decreasing=T, iris$Petal.Length),]
