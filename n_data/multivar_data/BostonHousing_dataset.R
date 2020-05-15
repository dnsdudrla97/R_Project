# BostonHouse
# crim : 지역의 1인당 범죄율
# rm : 주택 1 가구당 방의 개수
# dis : 보스턴의 5개 직업 센터까지의 거리
# tax : 재산세율
# medv : 주택 가격
install.packages(mlbench)
library(mlbench)
data("BostonHousing")
myds<-BostonHousing[,c("crim","rm","dis","tax","medv")]

# grp 변수 추가 (주택 가격 상/중/하 25.0 이상이면 상/17.0 이하이면 하/나머지를 중)
grp <-c()
for (i in 1:nrow(myds)) {
    if (myds$medv[i] >= 25.0) {
        grp[i] <- "H"
    } else if (myds$medv[i] <= 17.0) {
        grp[i] <- "L"
    } else {
        grp[i] <- "M"
    }
}
grp <- factor(grp)                          # 문자 벡터를 팩터 타입으로 변경
grp <- factor(grp, levels=c("H","M","L"))   # 레벨의 순서를 H, L, M -> H, M, L 변경
myds <- data.frame(myds, grp)               # myds에 grp 열 추가
head(myds)
str(myds)
table(myds$grp)                             # 주택 가격 그룹별 분포 (도수 분포표)

# 히스토그램 관측값들의 분포 확인
par(mfrow=c(2,3))
for (i in 1:5) {
    hist(myds[,i], main=colnames(myds)[i], col="yellow")
}
par(mfrow=c(1,1))   # 히스토그램 해제
# rm, mdev : 정규분포에 깝다.
# crim, dis : 한쪽으로 쏠리는 형상
# tax : 중간에 관측값이 없는 빈 구간이 존재하는 특성
# 관측값들이 정규분포가 아닌 이상 분포에 대한 해석이 필수

# 상자 그림에 의한 관측값의 분포 확인
# 정보(grp)를 제외하고 나머지 5개 변수에 대해 boxplot() 함수를 작성
par(mfrow=c(2,3))
for (i in 1:5) {
    boxplot(myds[,i], main=colnames(myds)[i])
}
par(mfrow=c(1,1))
# crim은 관측값들이 좁은 밀집되어 있고 (관측값들의 편차가 매우 작다.)