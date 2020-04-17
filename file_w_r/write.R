setwd("C:/Users/Younsle/Desktop/R/file_w_r/data")       # 작업 폴더 지정
my.iris<-subset(iris, Species='Setosa')                 # Setoas 품종 데이터 추출
write.csv(my.iris, "my_iris.csv", row.names=F)          # row.names=F -> 행 번호를 붙이지 않겠다.



