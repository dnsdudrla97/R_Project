#1
ds<-state.x77
ds[2,3]<-NA;ds[3,1]<-NA;ds[2,4]<-NA;ds[4,3]<-NA
#1-1
colSums(is.na(ds)) #결측값
#1-2
col_na<-function(x) {
    return(sum(is.na(x)))
}
ds[apply(ds,1,col_na)>0,] #apply(배열, 1:행2:열, 함수)
#1-3
sum(apply(ds,1,col_na)>0)
#1-4
ds.new<-ds[-apply(ds,1,col_na)>0,]
sum(apply(ds.new, 1, col_na)>0) # 확인차

#2
st<-data.frame(state.x77)
#2-1
par(mfrow=c(3,3))
for(i in 1:ncol(st)){
    boxplot(st[,i], main=colnames(st)[i])
}
#2-2
par(mfrow=c(3,3))
out.val<-c()

for(i in 1:ncol(st)){
    out.val<-boxplot.stats(st[,i])$out
    st[,i][st[,i] %in% out.val]<-NA    
}
#2-3
st2<-st[complete.cases(st),]
head(st2)

#3
#3-1
AQ<-airquality
#3-2
col_na<-function(x){
    return(sum(is.na(x)))
}
apply(AQ, 2, col_na)
#3-3
apply(AQ, 1, col_na)
#3-4
AQ[!(apply(AQ, 1, col_na)>0),]
which(apply(AQ, 1, col_na)>0)
#3-5
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
#4-1
state.x77[order(state.x77[,"Population"], decreasing = FALSE),]
#4-2
state.x77[order(state.x77[,"Income"], decreasing = TRUE),]
#4-3
state.x77[order(state.x77[,"Illiteracy"], decreasing = FALSE),][1:10,]

#5
#5-1
mt.gear<-split(x=mtcars, mtcars$gear)
summary(mt.gear)
#5-2
mt.gear$`4` # 기어가 4인것만 출력
#5-3
mt.gear.35<-merge(mt.gear$`3`, mt.gear$`5`, all=TRUE)
mt.gear.35
rbind(mt.gear$`3`, mt.gear$`5`)[order(rbind(mt.gear$`3`, mt.gear$`5`)[,"mpg"], decreasing = FALSE),]
#5-4
subset(x=mtcars, (wt>1.5) & (wt < 3.0))

#6
#6-1
library(mlbench)
data("Glass")
myds<-Glass
head(myds)
#6-2
aggregate(x=myds[,c("RI", "Na", "Mg", "Al", "Si")], by=list(Type=myds[,"Type"]), FUN=mean) #그룹, 평균

#7
library(mlbench)
data("Ionosphere")
myds<-Ionosphere
#7-2
head(myds)
aggregate(x=myds[,c("V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10")], by=list(Type=myds[,"Class"]), FUN=sd) # 그룹, 표준편차, aggregate

#8
set.seed(100)
#8-1
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

#14

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
#15-2 공통 열, 병합
merge(x=authors, y=books, by.x="surname", by.y="name")
#15-3 공통 열, 병합, 행들이 모두 표시
merge(x=authors, y=books, by.x="surname", by.y="name", all.x=TRUE)
#15-4
merge(x=authors, y=books, by.x="surname", by.y="name", all.y=TRUE)
#15-5 공통열
merge(x=authors, y=books, by.x="surname", by.y="other.author")