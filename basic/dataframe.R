# dataframe 여러 자료형을 사용하여 2차원 구조로 된 자료구조
# 숫자형 벡터 + 문자형 벡터 (서로 다른 형태의 데이터) -> 2차원 데이터 테이블
# 매트릭스 -> 모든 자료형이 동일
# 데이터 프레임 -> 다른 자료형 가능


#3-8
city<-c("Seoul", "Naju", "Dong")
rank<-c(1,3,2)
usle<-c(4,1,2)
city.info<-data.frame(city, rank, usle)
city.info

#iris dataset
#3-9
iris[,c(1:2)]
iris[1:2,c(1,3,5)]
iris[c(1:3),c("Sepal.Length", "Species")]
iris[1:5,]
iris[1:5,]
iris[1:5,c(1,3)]