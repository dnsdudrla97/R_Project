# apply()
# 반복 작업의 대상이 매트릭스, 데이터 프레임 행, 열 인경우
# for, while 대신 apply 사용
# 속도상승
# apply(dataset, row/col by, func)

# apply
apply(iris[,1:4], 1, mean)      # row 방향으로 함수 적용
apply(iris[,1:4], 2, mean)      # col 방향으로 함수 적용

# lapply(), sapply(), tapply(), mapply()..

apply(iris[,1:2], 1, sum)
