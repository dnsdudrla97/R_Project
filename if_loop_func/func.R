# 사용자 정의 함수
mymax<-function(x,y) {
    num.max<-x
    if (y > x) num.max<-y
    return(num.max)
}

mymax(10, 20)
a<-mymax(10, 20)
b<-mymax(30, 20)
print(a+b)

# 사용자 정의 함수의 매개변수에 초기값 설정
mydiv<-function(x, y=2) {
    result<-x/y
    return (result)
}

mydiv(x=10, y=3)
mydiv(10, 3)
mydiv(10)

#함수가 반환하는 결과값이 여러 개일때 처리
#list
myfunc<-function(x, y) {
    val.sum<-x+y
    val.mul<-x*y
    return(list(sum=val.sum, mul=val.mul))
}
result<-myfunc(5, 8)
s<-result$sum
m<-result$mul
cat('5+8=', s, '\n')
cat('5*8=', m, '\n')

myfunc2<-function(x, y) {
    tmp.sum<-x+y;
    tmp.mul<-x*y;
    return(list(sum=tmp.sum, mul=tmp.mul))
}
result<-myfunc2(10, 20)
class(result)
result
result$sum

setwd("C:/Users/Younsle/Desktop/R/if_loop_func/myfunc")
source("myfunc.R")      # 해당 파일안에 저장되어 있는 함수나 명령문을 실행

maxVar(mymax(10, 20), 20, 30)