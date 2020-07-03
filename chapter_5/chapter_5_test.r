### Function ###
도수분포표
1. table() #도수 분포표 계산
2. table()/length() #비율 출력


barplot() # 막대그래프
pie()     # 원그래프
mean()  #평균
mean(, trim=0.2) #절사평균 상위20%제외
median()    #중앙값
quantile() #사분위함수 quantile(data, (0:10)/10) 10%단위로 구간을 나누어 계산
summary()   # 사분위함수 최댓값, 최솟값, 출력
var()   #분산
sd()    #표준편타
range() #값의 범위
diff(range(data))   #최댓값, 최솟값의 차이

#히스토그램
hist(
    data,
    main="제목",
    xlab="X축 레이블",
    ylab="y축 레이블",
    border="막대 테두리색",
    col="막대 색",
    las=x출 글씨 방향(0~3),
    break=막대 개수 조절
)
#상자그림
boxplot(
    data,
    main="제목",
)
boxplot.stats() # 상자그림 최댓값 최솟값 등 자세한 정보 획득 함수
boxplot.stats()$out #상자 그림 특이값
boxplot.stats()$conf #상자 그림 중앙값 신뢰
boxplot(
    Petal.Length~Species,
    data=iris,
    main="Text"
)
################
#1
typeof(infert)
infert
#1-1 값 잘라내어 저장
edu<-infert[,"education"]
edu

#1-2
unique(edu) #중복 제거
levels(edu) 
#1-3
table(edu)/length(edu) #도수분포표 작성
#1-4
barplot(table(edu)/length(edu), main="education") #도수분포표 작성, 막대그래프

#2
#1-1
gender<-c("F", "F", "F", "M", "M", "F", "F", "F", "M", "M")
#1-2
table(gender)/length(gender) #도수분포표 작성
#1-3
par(mfrow=c(1,2)) 
barplot(table(gender)/length(gender), main="gender") #도수분포표 작성, 막대그래프
#1-4
pie(table(gender)/length(gender), main="gender") #도수분포표 작성, 원 그래프

#3
#3-1
season <- c("summer", "winter", "string", "fall", "summer", "fall", "winter", "summer", "summer", "fall")
#3-2
table(season)/length(season) #도수분포표 작성
#3-3
par(mfrow=c(1,2))
barplot(table(season)/length(season), main="season") #도수분포표 작성, 막대 그래프
#3-4
pie(table(season)/length(season), main="season") #도수분포표 작성, 원 그래프

#4
#4-1
score<-c(90,85,73,80,85,65,78,50,68,96)
names(score)<-c("KOR","ENG","ATH","HIST","SOC","MUSIC","BIO","EARTH","PHY","ART") # 데이터 이름 저장
#4-2
score
#4-3
mean(score) # 평균
median(score) # 중앙값
#4-4
sd(score) #표준편차
#4-5
names(score[which.max(score)]) #가장 성적이 높은 과목의 이름 출력 which 인덱스 ..
#4-6
boxplot(score) # 상자 그림
boxplot.stats(score)$out #boxplot.stats(score) 이상치에 해당하는 과목
#4-7
hist(score, main="학생성적", border="black", col="purple") #히스토그램 막대의 색 : 보라색, 제목

#5
#5-1
mean(mtcars[,"wt"])     #평균값
median(mtcars[,"wt"])   #중앙값
mean(mtcars[,"wt"], trim=0.15)  # 절사평균값(절사범위:15%)
sd(mtcars[,"wt"])               # 표준편차
#5-2
summary(mtcars[,"wt"]) # summary 함수 적용
#5-3 도수분포표 실린더
table(mtcars[,"cyl"])/length(mtcars[,"cyl"])
#5-4 이름이 없어~ 막대그래프 도수분포표
barplot(table(mtcars[,"cyl"])/length(mtcars[,"cyl"]))
#5-5
hist(mtcars[,"wt"]) # 히스토그램 중량
#5-6
boxplot(mtcars[,"wt"], main="mtcars 중량(wt)") # 상자그림
#5-7
boxplot(mtcars[,"disp"], main="mtcars 배기량(disp)") # 상자그림 배기량
#5-8
boxplot(mpg~gear, mtcars, main="mtcars 기어(gear) 연비(mpg)") # 기어수, 연비, 그룹 상자그림 비교

#6
#6-1
head(trees)
tail(trees)
#6-2
mean(trees[,"Girth"]) # trees 평균
median(trees[,"Girth"]) # trees 중앙값
mean(trees[,"Girth"], trim=0.75) # trees 절사평균 
sd(trees[,"Girth"]) # 표준 편차 trees
#6-3
hist(trees[,"Girth"]) # 히스토그램
#6-4
boxplot(trees[,"Girth"], main="나무 지름") # 상자그림
#6-5
mean(trees[,"Height"]) # 평균값
median(trees[,"Height"]) # 중앙값
mean(trees[,"Height"], trim=0.50) # 절사평균값
sd(trees[,"Height"]) # 표준편차
#6-6
hist(trees[,"Height"]) # 히스토그램 trees$Height
#6-7
boxplot(trees[,"Height"], main="나무 높이") # 상자그림trees$Height

#7
typeof(Orange) 
#7-1
head(Orange)
#7-2
mean(Orange[,"age"]) # Orange$age 평균
median(Orange[,"age"]) # Orange$age 중앙값
mean(Orange[,"age"], trim=0.15) # Orange$age 절사평균
sd(Orange[,"age"]) # Orange$age 표준편차
#7-3
hist(Orange[,"age"]) # Orange$age 히스토그램
#7-4
boxplot(age~Tree, data=Orange) # Orange$age~Tree 
#7-5 (수정 필요)
mean(subset(Orange, Tree!=2)$circumference) # 평균 Tree 2 제외
median(subset(Orange, Tree!=2)$circumference) # 중앙값 Tree 2 제외
mean(subset(Orange, Tree!=2)$circumference, trim=0.15) # 절사평균 Tree 2 제외
sd(subset(Orange, Tree!=2)$circumference) # 표쥰 편차 Tree 2 제외
#7-6 (수정 필요) #히스토그램 2 제외
hist(subset(Orange, Tree!=2)$circumference)
#7-7 상자그림
boxplot(circumference~Tree, data=Orange)





##### dumy ####
Orange$Tree
Orange[,"age"]
Orange[,"circumference"]-
Orange[,!(Orange$Tree==2)]

mean((Orange[,"circumference"]) & !(Orange[,"Tree"]==2))

Orange[,c("Tree")]==2

