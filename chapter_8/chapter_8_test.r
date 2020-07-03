### func ###
# 트리맵
treemap(
    data,
    index=c("content1", "content2"),
    vSize="타일의 크기를 결정하는 열을 지정한다.",
    vColor="타일의 색을 결정하는 열을 지정",
    type="타일의 컬러링 방법을 지정한다. value, vColor에서 지정한 열에 저장된 값의 크기에 의해 색이 결정된다. value, index, comp, dens",
    bg.lables="레이블의 배경색 지정",
    title="트리맵의 제목"
)
# 원형
symbols(
    원의x좌표 열, 원의y좌표 열,
    circles=원의반지름열,
    inches=원의크기조절값,
    fg="원의테두리색",
    bg="원의바탕색",
    lwd=원의테두리선두께,
    xlab="x축이름",
    ylab="y축이름",
    main="제목"
)
text(
    텍스트가추력될X좌표, 텍스트가출력될Y좌표,
    rownames(출력할텍스트),
    cex=폰트크기,
    col="폰트칼라"
)
#모자이크플롯
mosaicplot(
    ~gear+vs, # 모자이크 플록을 작성할 대상 변수를 지정 ~ 다음의 변수가 x축 방향으로 표시되고 + 다음의 변수가 y축 방향으로 표시
    data=mtcars, # 모자이크 플롯을 작성할 대상 데이터셋을 지정
    color=TRUE, # y축 변수의 그룹벼로 음영을 달리하여 표시
    main="Gear and VS" # 제목
)


###########


#시각화
install.packages("treemap")
#1
us<-data.frame(state.x77, state.division) 
#1-1 트리맵 타일의 주리 
us<-data.frame(us, state.name)
colnames(us)
library(treemap)
treemap(us, index=c("state.division", "state.name"), vSize="Population", vColor="Income", type="value")
#1-2 트리맵
treemap(us, index=c("state.division", "state.name"), vSize="HS.Grad", vColor="Murder", type="value")
#1-3 버블 차트
symbols(
    x=us$Income,
    xlab="Income",
    y=us$Illiteracy,
    ylab="Illiteracy",
    circles=us$Population,
    bg="green",
    fg="purple")
text(
    x=us$Income,
    y=us$Illiteracy,
    labels=us$state.name,
    cex=0.6,
    col="black")

#1-4 버블 차트
symbols(
    x=us$Illiteracy,
    xlab="Illiteracy",
    y=us$Murder,
    ylab="Murder",
    circles=us$Area,
    bg="green",
    fg="purple")
text(
    x=us$Illiteracy,
    y=us$Murder,
    labels=us$state.name,
    cex=0.6,
    col="black")

#2 swiss
#2-1 트리, 그룹
library(treemap)
colnames(swiss)

edu<-c()
for(i in 1:nrow(swiss)){
    if(swiss[i, "Education"]<=6) {
        edu[i]<-"LOW"
    } else if(swiss[i, "Education"]>=13) {
        edu[i]<-"HIGH"
    } else{
        edu[i]<-"MID"
    }
}
myds<-data.frame(swiss, edu, stname=rownames(swiss))
treemap(dtf=myds, index=c("edu", "stname"), type="value", vSize="Fertility", vColor="Agriculture")

#2-2 트리맵
treemap(dtf=myds, index="stname", type="value", vColor="Examination", vSize="Catholic")


#3 버블 차트
symbols(
    x=swiss$Fertility,
    y=swiss$Agriculture,
    xlab="Fertility",
    ylab="Agriculture",
    circles = swiss$Education,
    bg="green")
text(x=swiss$Fertility, y=swiss$Agriculture, labels=rownames(swiss))

#4 버블차트
symbols(x=trees$Girth, y=trees$Height, circles=trees$Volume, xlab="Girth", ylab="Height", bg="blue")
text(x=trees$Girth, y=trees$Height, labes=1:nrow(trees), col="red")

#5 HairEyeColor, 모자이크 플롯
mosaicplot(HairEyeColor)

#6 santa, mosaicplot, 
santa<-data.frame(
    belief=c(
        'no belief','no belief', 'no belief',
        'no belief', 'belief', 'belief',
        'belief', 'belief', 'belief',
        'belief', 'no belief', 'no belief',
        'belief', 'belief', 'no belief', 'no belief'
        ),
    sibling=c(
        'older brother','older brother','older brother',
        'older sister','no older sibling','no older sibling',
        'no older sibling','older sister','older brother', 
        'older sister', 'older brother', 'older sister', 
        'no older sibling', 'older sister', 'older brother', 
        'no older sibling'
        )
    )
# 모자이크 플롯 
mosaicplot(~belief+sibling, data=santa, color=TRUE, main="Santa beilef?")

#7 ggplot 막대그래프
colnames(mtcars)
library(ggplot2)
ggplot(mtcars, aes(x=gear))+geom_bar()+labs(x="gear", y="freq")
table(mtcars$gear)


#8 ggplot 막대그래프
ggplot(mtcars, aes(x=cyl))+geom_bar()

#9 ggplot 히스토그램
ggplot(mtcars, aes(x=mpg))+geom_histogram(binwidth=5.0, position="dodge")+labs(y="freq")

#10 trees, ggplot 히스토그램
ggplot(trees, aes(x=Girth))+geom_histogram(binwidth=3.0, fill="steelblue")+labs(x="나무둘레", y="빈도")

#11 ggplot 산점도, mtcars
points<-as.integer(mtcars$gear)
color<-c("red", "green", "blue") #gear3 == red, 4 == green, 5 == blue
ggplot(mtcars, aes(x=mpg, y=wt))+geom_point(size=2, colour=color[points-2])

#12 ggplot 상자그림, mtcars
colnames(mtcars)
ggplot(data=mtcars, aes(y=mpg, fill=gear))+geom_boxplot()

#13
year<-c(2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026)
population<-c(51014,51245,51446,51635,51811,51973,52123,52261,52388,52504,52609,52704)
py<-data.frame(year, population)
ggplot(data=py, aes(x=year, y=population))+geom_line(col="red")

#14
year<-c(20144,20151,20152,20153,20154,20161,20162,20163,20164,20171,20172,20173)
men<-c(73.9,73.1,74.4,74.2,73.5,73,74.2,74.5,73.8,73.1,74.5,74.2)
women<-c(51.4,50.5,52.4,52.4,51.9,50.9,52.6,52.7,52.2,51.5,53.2,53.1)
eco<-data.frame(year, men, women)
color<-c("red", "green")
ggplot(data=eco, aes(women, men, color=year))+geom_line()+geom_point(size=3) # case1
ggplot(data=eco, aes(women, men))+geom_line(aes(color = year)) # case2
plot(x=year, y=men, main="남녀 경제활동참가율", lty=2, type="b", col="red", ylab="percentage", ylim=c(50,75))
lines(x=year, y=women, type='b', col="blue")

#15  3차원 산점도 Rtsne
install.packages(c("rgl", "car", "mgcv", "Rtsne"))
library("car")
library("rgl")
library("mgcv")
library("Rtsne")

myds<-data.frame(state.x77)
tsne<-Rtsne(X=myds, dim=2, perplexity=15)
mydt<-data.frame(tsne$Y)
# 2차원 산점도
ggplot(mydt, aes(x=X1, y=X2))+geom_point(size=2)
# 3차원 산점도
tsne<-Rtsne(X=myds, dim=3, perplexity=15)
mydt<-data.frame(tsne$Y)
scatter3d(x=mydt$X1, y=mydt$X2, z=mydt$X3)

#16 3차원 산점도 2차원 산점도 swiss
myds<-data.frame(swiss)
tsne<-Rtsne(X=myds, dim=2, perplexity=15)
mydt<-data.frame(tsne$Y)
ggplot(mydt, aes(x=X1, y=X2))+geom_point(size=2) 
#3차원 산점도
tsne<-Rtsne(X=myds, dim=3, perplexity=15)
mydt<-data.frame(tsne$Y)
scatter3d(x=mydt$X1, y=mydt$X2, z=mydt$X3)

pts<-as.numeric(iris[,"Species"]) 
levels(iris[,"Species"]) 
colors<-c("red", "green", "blue")
plot(
    Sepal.Length~Sepal.Width,
    data=iris,
    pch=c(pts)+3,
    col=colors[pts],
    main="setosa(red), versicolor(green), virginica(blue)"
)


