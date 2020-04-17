z<-matrix(1:20, nrow=4, ncol=5)
z

z2<-matrix(1:20, nrow=4, ncol=5, byrow=T)
z2

x<-1:4
y<-5:8
z3<-matrix(1:20, nrow=4, ncol=5)

m1<-cbind(x, y)
m1

m2<-rbind(x, y)
m2

m3<-rbind(m2, x)
m3

m4<-cbind(z3, x)
m4


#matrix 값 추출(index)
z<-matrix(1:20, nrow=4, ncol=5)
z
z[1,1]
z[4,4]
z[2,]
z[,3]

z[2,1:3]
z[1,c(1,2,4)]
z[1:2,]
z[,c(1:3)]
z[,c(1,4)]

#3-6 matrix's row, col name settings
score<-matrix(c(90,85,69,78,
                85,96,49,95,
                90,80,70,60),
                nrow=4, ncol=3)
score
rownames(score)<-c('Namin', 'Namin2', 'Namin3', 'Namin4')
colnames(score)<-c('love', 'love2', 'love3')

score

#3-7 row, col names
score
score['Namin', 'love2']
score['Namin2', c('love', 'love3')]
score['Namin3',]
score[,'love']
rownames(score)
colnames(score)
colnames(score)[2]

# 2차원의 자료구조
# matrix() : 매트릭스를 생성
# data.frame() : 데이터 프레임 생성
# cbind(), rbind() : 열, 행방향을 묶는다. (벡터, 매트릭스, 데이터프레임)

# 매트릭스, 데이터프레임
# rownames() : 행 이름 출력
# colnames() : 열 이름 출력
# dim() : 행과 열의 개수
# nrow() : 행의 개수를 출력
# ncol() : 열의 개수를 출력
# haed() : 시작 부분에 있는 데이터의 내용을 출력
# tail() : 끝 부분에 있는 데이터 중 일부 출력
# str() : 매트릭스, 데이터프레임의 요약 정보
# unique() : 그룹(종류)의 값이 지정된 벡터에서 중복을 제외, 그룹 확인
# table() : 그룹(종류)의 값이 저장된 벡터에서 각 그룹별 몇 개의 관측지가 존재하는지 출력(도수분포표)

# 매트릭스, 데이터프레임
# colSums() : 열별 합계를 출력
# rowSums() : 행별 합계를 출력
# colMeans() : 열별 평균을 출력
# rowMeans() : 행별 평균을 출력
# t() : 전치
# subset() : 조건에 맞는 행출력
# class() : 자료구조 확인
# is.matrix() : 매트릭 여부 확인
# is.data.frame() : 데이터프레임 여부 롹인
