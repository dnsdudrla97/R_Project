weight_var <- c(60, 62, 64, 65, 68, 69)
weight_heavy <- c(weight_var, 120)
weight_var
weight_heavy

# 평균 mean
mean(weight_var)
mean(weight_heavy)

# 중앙값
median(weight_var)
median(weight_heavy)

#절사 평균(상하위 20%제외), trim=0.2 -> 상하위 값 %지정 제외
mean(weight_var, trim = 0.2)
mean(weight_heavy, trim = 0.2)

#사분위수
mydata <- c(60, 62, 64, 65, 68, 69, 120)
quantile(mydata)
quantile(mydata, (0:10) / 10) # 10% 단위로 구간을 나누어 계산
summary(mydata)

#산포
mydata <- c(60, 62, 64, 65, 68, 69, 120)
var(mydata) #분산
sd(mydata) #표준편차
range(mydata) #값의 범위
diff(range(mydata)) # 최댓값, 최소값의 차이


#히스토그램
dist <- cars[, 2]
hist(dist, main = "Histogram for limit",
    xlab = "liit",
    ylab = "frequecy",
    border = "blue",
    col = "green",
    las = 2,
    breaks = 5)

# 상자 그림
dist<-cars[,2]      # 자동차 제동거리
boxplot(dist, main="자동차 제동거리")
boxplot.stats(dist)

iris
# 그룹이 있는 자료의 상자
boxplot(Petal.Length~Species, data=iris, main="품종별 꽃잎의 길이")

# 그룹의 정보 자료가 동일한 데이터셋에 있지 않을 때
boxplot(iris$Petal.Lenght~iris$Species, main="품종별 꽃잎의 길이")


# 한 화면에 그래프 여러 개 출력
par(mfrow=c(1,3))
barplot(table(mtcars$carb),
main="Barplot of Carburetors",
xlab="#of carburetors",
ylab="frequecy",
col="blue")

barplot(table(mtcars$cyl),
main="Barplot of cylender",
xlab="#of cylender",
ylab="frequecny",
col="red")

barplot(table(mtcars$cyl),
main="Barplot of Grar",
xlab="#of gears",
ylab="frequecny",
col="green")
par(mfrow=c(1,1))   # 가상화면 분할 해제








