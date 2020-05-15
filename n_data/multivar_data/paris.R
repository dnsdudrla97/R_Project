# 산점도 = 두 개의 변수에 대해서 작성한다.
# 두 개씩 짝을 지어 산점도를 작성해야 하는 불편함 발생
# 여러 개의 변수에 대해 짝지어진 산점도를 한 번에 그리는 pairs() 함수

vars <- c("mpg", "disp", "drat", "wt") # 대상 변수
target <- mtcars[,vars]
head(target)
pairs(target, main = "Multi Plots") # 대상 데이터

# 4개의 변수 mpg, disp, drat, wt, -> target
# 다중 산점도 pairs() 
# plot(iris[,1:4]) == pairs(iris[,1:4])  

# 산점도를 작성할 때 그룹 정보를 알고 있다면 산점도 작성 시 각 그 룹별 관측값
# 들에 대해 서로 다른 색과 점의 모양으로 표시할 수 있다
# 서로 간의 관계성을 파악할 수 있다.
iris_2<-iris[,3:4]      # 데이터 준비 (3,4 열의 값들 만 출력)
point<-as.numeric(iris$Species)     # 점의 모양 (펙터 타입이므로 숫자 타입으로 변환 1,2,3)
point
color<-c("red", "green", "blue")
plot(iris_2,
main="Iris plot",
pch=c(point),
col=color[point])       # point 값이 1이면 color[1], red로 설정된다.
# 산점도를 그릴때 그룹 정보를 활용하여 변수 간의 관계와 그룹 간의 관계성