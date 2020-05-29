# 특이값(이상치)-> 정상적인 데이터의 분포 범위 밖에 위치하는 값
# 1. 입력 오류에 의해 발생
# 2. 일반인 몸무게에 씨름선수 몸무게가 더해진거와 같다.
# 3. 실제로 특이한 값일 수 있다.
# 4. 제조 공정에서 불량인 제품을 선별, 은행 거래 시스템에서 사기 거래를 탐지

# 데이터 분석에서 특이값이 포함된 채 평균 등을 계산시 데이터의 양상을 파과한다.
# 그러므로 제외 하자

#특이값 추출 및 제거
# 상자 그림을 통한 특이값 확인
st<-data.frame(state.x77)
boxplot(st$Income)
boxplot.stats(st$Income)$out        # OUT 특이값

# 특이값을 포함한 행 제거
# 이상치를 NA로 바꾸고 NA를 포함한 행을 제거하는 방식
out.var <- boxplot.stats(st$Income)$out     # 특이값 추출
# out.var 값에 여러개의 특이한 값을 포함한 벡터이기에 == 대신 %in% 사용
st$Income[st$Income %in% out.var]<-NA       
head(st)
newdata<-st[complete.cases(st),]            # 성공된 케이스만 따로 벡터화 
head(newdata)