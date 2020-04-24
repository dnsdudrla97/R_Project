# which() 함수는 조건에 맞는 값이 벡터 어떤 위치에 있는지 확인 (index)
score<-c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
which(score==69)
which(score>=85)
max(score)
which.max(score)
min(score)
which.min(score)

idx<-which(score<=60)
score[idx]<-61
score

idx<-which(score>=80)
score.heigh<-score[idx]
score.heigh

#matrix, dataframe
idx<-which(iris$Petal.Length>5.0)
idx
iris.big<-iris[idx,]
iris.big

#1~4열의 값 중 5보다 큰 값의 행과 열의 위치
#which() 매트릭스, 데이터프레임 안에 있는 특정 값의 행과 열의 위치를 확인할시 -> arr.ind=TRUE 
idx<-which(iris[,1:4]>5.0,arr.ind = TRUE)
idx