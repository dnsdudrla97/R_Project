#Frequency distribution table
# 관측값들의 종류별로 개수를 세는 것
# 종류별로 비율을 알 수 있고, 이 결과를 이용하여 막대그래프나 원그래프를 작성할 수 있다.

fav<-c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
    'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')

fav
table(fav)

table(fav) / length(fav)    # 비율 출력



#막대그래프(정보 시각화)
ds<-table(fav)
ds

barplot(ds, main='fav seasson')

#순서 정렬
ds.new <- ds[c(2,3,1,4)]
ds.new

# 원그래프
# 원그래프는 하나의 원 안에서 각 자료값이 차지하는 비율을 넓이로 나타낸 그래프
# angle : 각도
# init.angle : 시작점 각도
# col : 색상
# labels : 파이차트 각 내용 레이블
# radius : 원형의 크기
# clockwise : T는 시계방향(default), F는 반시계

ds<-table(fav)
ds
pct<-round(ds/sum(ds)*100)
lib<-paste(pct,"%", sep="")
pie(ds, labels = lib, col=rainbow(length(lib)), main='fav seasson')

# simple Pie Chart
slices<-c(10, 12, 4, 16, 8)
lbls<-c("US", "UK", "Austrialia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")
# Pie Chart with Percentages
slices<=c(10,12,4,16,8)
libls<-c("US", "UK", "Austrialia", "Germany", "France")
pct<-round(slices/sum(slices)*100)
lbls<-paste(lbls, pct)
lbls<-paste(lbls, "%", sep="")
pie(slices, labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")


#