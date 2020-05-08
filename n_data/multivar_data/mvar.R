# 산점도
wt <- mtcars$wt #중량 자료
mpg <- mtcars$mpg #연비 자료
plot(wt, mpg, #2개 변수
        main = "중량-연비 그래프", #제목
        xlab = "중량", #x
        ylab = "연비(mpg)", #y
        col = "red", 
        pch = 15) #point의 종류

