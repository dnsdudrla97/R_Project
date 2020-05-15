# 선 그래프
# 연월일, 시간을 나타낸 값 -> X 축 시간으로 지정
# 시간의 변화율에 따라 자료의 증감 추이를 쉽게 확인할 수 있다.
# 시간의 변화에 따라 자료를 수집한 경우 이를 시계열 자료 (Time Series Data)
# 단순 선 그래프를 통해서 증감 추이를 확인하는 방법

# 선그래프 작성
month = 1:12 # 자료 입력
late = c(5, 8, 7, 9, 4, 5, 12, 13, 8, 6, 6, 4) # 자료 입력
plot(month,                     # x data
        late,                   # y data
        main = "late",          # title
        type = "b",             # 그래프 종류 선택 (알파벳)
        lty = 1,                # 선의 종류
        lwd = 1,                # 선의 굵기 선탣
        xlab = "Month",         # x축 레이블
        ylab = "Late cnt",      # y축 레이블
)

# 복수 선 그래프
month=1:12
late1=c(5,8,7,9,4,6,12,13,8,6,6,4)
late2=c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month,                     # x data
        late1,                   # y data
        main = "late student",          # title
        type = "b",             # 그래프 종류 선택 (알파벳)
        lty = 1,                # 선의 종류
        lwd = 1,                # 선의 굵기 선탣
        col = "red",
        xlab = "Month",         # x축 레이블
        ylab = "Late cnt",      # y축 레이블
        ylim = c(1, 15)         ## y축 값의 (하한, 상한)
)
# lines 함수는 plot() 함수로 작성한 그래프 위에 선을 겹쳐서 그리는 역활
# 이때 사용한 자료는 2반의 자료인 late2이다.
lines(month,
        late2,
        type="b",
        col="blue")