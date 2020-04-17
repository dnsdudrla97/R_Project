# for, while

for (i in 1:5) {
    print('*')
}

# 반복 범위에 따른 변수 값 변화
for (i in 6:10) {
    print(i)
}

for (i in 1:9) {
    cat('2 *', i,'=', 2*i,'\n')
}

for (i in 1:20) {
    if (i%%2==0)
        print(i)
}

sum<-0
for (i in 1:100) {
    sum = sum + i
}
sum

# iris 꽃잎의 길이에 따른 분류 작업
# Petal.Length > 1.6 = 'L'  _____ >= 5.1 = 'H'  _____ else = 'M'
norow<-nrow(iris)
mylabel<-c()        # 벡터 초기화
for (i in 1:norow) {
    if (iris$Petal.Length[i] <= 1.6) {
        mylabel[i]<-'L'
    } else if (iris$Petal.Length[i] >= 5.1) {
        mylabel[i]<-'H'
    } else {
        mylabel[i]<-'M'
    }
}

print(mylabel)
newds<-data.frame(iris$Petal.Length, mylabel)
head(newds)


