###
#결측값 
is.na(data) #NA 여부 확인
sum(is.na(data)) #NA의 개수 확인
sum(data, na.rm=TRUE) #NA를 제외하고 합계 계산
#결측값 대체 및 제거
z1<-c(1,2,3,NA,5,NA,8)
z2<-c(5,8,1,NA,3,NA,7)
z1[is.na(z1)]<-0 #NA를 0으로 치환
z3<-as.vector(na.omit(z2)) # NA를 제거하고 새로운 벡터 생성
# 결측값이 포함된 데이터프레임 생성
x<-iris
x[1,2]<-NA;x[1,3]<-NA;x[2,3]<-NA
#for 문을 이용하여 결측값 열별 확인
for (i in 1:ncol(x)) {
    this.na<-is.na(x[,i])
    cat(colnames(x)[i], "\t", sum(this.na), "\n")
}
#apply를 이용한 방법
col_na<-function(y){
    return(sum(is.na(y)))
}
na_count<-apply(x, 2, FUN=col_na)
na_count
#데이터프레임의 행별 결측값 ㅗ학인
rowSums(is.na(x))   # 행별 NA의 개수
sum(rowSums(is.na(x))>0)    #NA가 포함된 개수
sum(is.na(x))   #데이터셋 전체에서 NA개수

x[!complete.cases(x),] #NA가 포함된 행들 출력
y<-x[complete.cases(x),] #NA가 포함된 행들 제거

#특이값
#특이값 추출
out.val<-boxplot.stats(st$Income)$out
st$Income[st$Income %in% out.val]<-NA #특이값을 NA로 대체
newdata<-st[complete.cases(st),]  #NA가 포함된 행 제거

#데이터 정렬
sort(data) # 오름차순
sort(data, decreasing=T) #내림차순

#데이터 분리
split(iris, iris$Species) #품종별로 데이터 분리
summary(data) #data요약
subset(iris, subset=Sepal.Length>7.6, select=c(Petal.Length, Petal.Width))

#데이터 샘플링
#숫자 임의 추출
x<-1:100
y<-sample(x, size=10, replaces=FALSE) #비복원 추출 임의로 10개 추출
#행 임의로 추출
idx<-sample(1:nrow(iris), size=50,
    replace=FALSE)
dim() # 행과 열 개수 확인
#데이터 집곔
aggregate(작업 수행 데이터셋, by=집계작업 기준, FUN=집계작업)
#데이터 병합
merge(x,y,by=병합기준)

###

#1 결측값
ds<-state.x77
ds[2,3]<-NA;ds[3,1]<-NA;ds[2,4]<-NA;ds[4,3]<-NA
#1-1 각 열별로 결측값이 몇 개
colSums(is.na(ds)) #결측값
#1-2 결륵값이 포함된 행들의 데이터 출력
col_na<-function(x) {
    return(sum(is.na(x)))
}
ds[apply(ds,1,col_na)>0,] #apply(배열, 1:행2:열, 함수)
#1-3 결측값이 포함된 행 몇 개
sum(apply(ds,1,col_na)>0)
#1-4 결측값이 포함된 행 제외, 새로운 데이터 셋
ds.new<-ds[-apply(ds,1,col_na)>0,]
sum(apply(ds.new, 1, col_na)>0) # 확인차

#2 state.x77
st<-data.frame(state.x77)
#2-1 st의 각 변수들에 대해 특이값이 존재하는지 상자 그림
par(mfrow=c(3,3))
for(i in 1:ncol(st)){
    boxplot(st[,i], main=colnames(st)[i])
}
#2-2 특이값이 존재하는 경우 이상치를 NA로 대체
par(mfrow=c(3,3))
out.val<-c()

for(i in 1:ncol(st)){
    out.val<-boxplot.stats(st[,i])$out
    st[,i][st[,i] %in% out.val]<-NA    
}
#2-3 st에서 NA가 존재하는 행들을 제거하여 st2에 저장
st2<-st[complete.cases(st),]
head(st2)

#3
#3-1 airquality를 AQ에 저장
AQ<-airquality
#3-2 AQ에서 열별로 NA개수 출력
col_na<-function(x){
    return(sum(is.na(x)))
}
apply(AQ, 2, col_na)
#3-3 AQ에서 행별로 NA의 개수 출력
apply(AQ, 1, col_na)
#3-4 AQ에서 NA를 포함하지 않은 행들만 출력
AQ[!(apply(AQ, 1, col_na)>0),]
which(apply(AQ, 1, col_na)>0)
#3-5 AQ에서 NA를 NA가 속한 열의 평균값으로 치환하여 AQ2로 저장하고 AQ2의 내용 출력
for(i in 1:(ncol(AQ))) {
    ifelse(length(AQ[(AQ[,i] %in% NA),][,i])!=0, AQ[(AQ[,i] %in% NA),][,i]<-mean(AQ[!(AQ[,i] %in% NA), i]), next)
}
AQ2<-AQ
AQ<-airquality # reset
mean(AQ[!(AQ[,1] %in% NA), 1])
tmp<-AQ2[which(AQ[,1] %in% NA), 1]
names(tmp)<-which(AQ[,1] %in% NA)
AQ2

#4
#4-1 인구수를 기준으로 오르차순으로 정렬
state.x77[order(state.x77[,"Population"], decreasing = FALSE),]
#4-2 소득을 기준으로 내림차순으로 정렬
state.x77[order(state.x77[,"Income"], decreasing = TRUE),]
#4-3 문맹률가 낮은 산위 10개 주의 이름과 문맹률 출력
state.x77[order(state.x77[,"Illiteracy"], decreasing = FALSE),][1:10,]

#5
#5-1 split() mtcars데이터셋을 gear의 개수에 따라 그룹으로 나누어라
mt.gear<-split(x=mtcars, mtcars$gear)
summary(mt.gear)
#5-2 gear의 개수가 4인 그룹
mt.gear$`4` # 기어가 4인것만 출력
#5-3 gear의 개수가 3인 그룹과 5인 그룹의 데이터를 합쳐서 mt.gear.35에 저장하고 출력
mt.gear.35<-merge(mt.gear$`3`, mt.gear$`5`, all=TRUE)
mt.gear.35 #
rbind(mt.gear$`3`, mt.gear$`5`)[order(rbind(mt.gear$`3`, mt.gear$`5`)[,"mpg"], decreasing = FALSE),]
#5-4 wt(중랼)가 1.5~3.0 사이인 행들을 출력하시오
subset(x=mtcars, (wt>1.5) & (wt < 3.0))

#6
#6-1 Glass 데이터셋을 myds에 저장
library(mlbench)
data("Glass")
myds<-Glass
head(myds)
#6-2 myds에서 Type 열의 값을 그룹으로 하여 RI, Na, MG, Al, Si 열의 값들의 평균을 구해라 
aggregate(x=myds[,c("RI", "Na", "Mg", "Al", "Si")], by=list(Type=myds[,"Type"]), FUN=mean) #그룹, 평균

#7 Ionosphere 데이터셋을 myds에 저장
library(mlbench)
data("Ionosphere")
myds<-Ionosphere
#7-2 myds에서 class V1열의 값을 그룹으로 하여 V3~V10열의 값득의 표쥰편차를 출력하시오
head(myds);typeof(myds)
aggregate(x=myds[,c("V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10")], by=list(Type=myds[,"Class"]), FUN=sd) # 그룹, 표준편차, aggregate

#8
set.seed(100)
#8-1 20개의 행을임의로 추출하여 st20에저장 나머지 행들은 st.other에 저장
idx<-sample(1:nrow(state.x77), size=20, replace=FALSE)
st20<-state.x77[idx,] #행 임의추출 sample
st.other<-state.x77[-idx,] # 나머지행 추출
st20
st.other
#9 행 임의추출
set.seed(100)
spcs<-levels(iris[,5])
iris.10<-data.frame()

for(i in 1:length(spcs)){
    set.seed(100)
    if(i==1) {
        iris.10<-subset(iris, Species==spcs[i])[sample(1:50, size=10, replace=FALSE),]
    } else {
        iris.10<-rbind(iris.10, subset(iris, Species==spcs[i])[sample(1:50, size=10, replace=FALSE),])
    }
}
iris.10

#10 행 순서 임의로 바꾸기, 셔플링
set.seed(100)
iris[sample(x=1:nrow(iris), size=nrow(iris), replace=FALSE),]

#11 3개의 품종 2개씩 짝지어 combn()<-짝
spcs<-levels(iris[,"Species"])
for(i in 1:dim(combn(length(spcs),2))[2]) {
    cat(spcs[combn(length(spcs),2)[1,i]],spcs[combn(length(spcs),2)[2,i]], "\n")
}
spcs[combn(3,2)]

#12 짝 combn
combn.color <-c("red", "green", "blue","black", "yellow")[combn(5,3)]
for(i in 1:(length(combn.color)/3)){
    cat(combn.color[3*i-2], combn.color[3*i],combn.color[3*i], "\n")
}

#13 subset 
subset(x=state.x77, subset=state.x77[,"Area"] > state.x77["Alabama", "Area"] & state.x77[,"Area"] < state.x77["California", "Area"], select=c("Population", "Income", "Area"))

#14 subway.csv, subway_latlong.csv 파일을 읽고 병합하여 subway.tot에 저장 (병합 기준: STATION_CD, STATION)
setwd("C:/Users/Younsle/Desktop/R/chapter_7")
subway<-read.csv("subway.csv", header=TRUE) # subway.csv
head(subway)
subway_latlong<-read.csv("subway_latlong.csv") # subway_latlong.csv
head(subway_latlong)
subway.tot<-merge(x=subway, y=subway_latlong, by.x="station",by.y="STATION_CD") # 14-1 병합
head(subway.tot);typeof(subway.tot)
#14-2 역 이름과 날짜 기준으로 on_tot과 off_tot을 집계(합계) 출력
aggregate(x=subway.tot,by=list(stat_name = subway.tot$stat_name, date=subway.tot$income_date), FUN=sum) 
aggregate() 

#15-2 공통 열, 병합
merge(x=authors, y=books, by.x="surname", by.y="name")
#15-3 공통 열, 병합, 행들이 모두 표시
merge(x=authors, y=books, by.x="surname", by.y="name", all.x=TRUE)
#15-4
merge(x=authors, y=books, by.x="surname", by.y="name", all.y=TRUE)
#15-5 공통열
merge(x=authors, y=books, by.x="surname", by.y="other.author")

#15
#15-1
authors<-data.frame(
    surname=c("Twein", "Venables", "Tierney", "Ripley", "McNeil"),
    nationality=c("US", "Australia", "US", "UK", "Australia"),
    retired=c("yes", rep("no", 4)))
books<-data.frame(
    name=c("Johns", "Venables", "Tierney", "Ripley", "Ripley",
    "McNeil"),
    title=c("Exploratory Data Analyscis",
    "Modern Applied Statistics ...",
    "LISP-STAT",
    "Spatial Statistics", "Stochastic Simulation",
    "Interactive Data Analysis"),
    other.author=c(NA, "Ripley", NA, NA, NA, NA))
authors
books
#14 (미수정)

#15-2 공통 열, 병합
merge(x=authors, y=books, by.x="surname", by.y="name")
#15-3 공통 열, 병합, 행들이 모두 표시
merge(x=authors, y=books, by.x="surname", by.y="name", all.x=TRUE)
#15-4
merge(x=authors, y=books, by.x="surname", by.y="name", all.y=TRUE)
#15-5 공통열
merge(x=authors, y=books, by.x="surname", by.y="other.author")
