# file data read (.csv, .xlsx) #workingdir
# setwd("C:/Users/Younsle/Desktop/R/file_w_r/data")       # 작업 폴더 지정
# read_test<-read.csv("airquality.csv", header=T)         # .csv 파일 읽기 header=T -> 데이터 첫 번째 줄 열의 이름으로 출력 (header = F ->값으로만)
read_test<-read.csv(file.choose(), header=T)         # 파일의 경로를 모를경우 file.choose() 사용하여 파일 탐색기를 작동한다.
head(read_test)
str(read_test)

