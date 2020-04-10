# dataframe 여러 자료형을 사용하여 2차원 구조로 된 자료구조
# 숫자형 벡터 + 문자형 벡터 (서로 다른 형태의 데이터) -> 2차원 데이터 테이블
# 매트릭스 -> 모든 자료형이 동일
# 데이터 프레임 -> 다른 자료형 가능


#3-8
city<-c("Seoul", "Naju", "Dong")
rank<-c(1,3,2)
usle<-c(4,1,2)
city.info<-data.frame(city, rank, usle)
city.info

#iris dataset
#3-9
iris[,c(1:2)]
iris[1:2,c(1,3,5)]
iris[c(1:3),c("Sepal.Length", "Species")]
iris[1:5,]
iris[1:5,]
iris[1:5,c(1,3)]

# matrix, Dataframe
# 3-10
dim(iris)   # row col number
nrow(iris)
ncol(iris)
colnames(iris)
rownames(iris)
head(iris)
tail(iris)
head(iris, 5)   # head, tail parm -> datframe name, limit number

# iris dataframe add content
str(iris)   # dataset 
# 'data.frame':   150 obs. of  5 variables:
# obs = row, variables = col (obs == observation, variables == var)
#  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
# type : num(numberic)
#  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
#  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
# datatype Factor (char)
# w/3 lefels -> with 3 levels ('3 things') -> setosa, versicolr, ... , 1 1 1 1 1 -> things name of number 1

iris[,5]
iris[c(1:2),]
iris[c(1:5),"Sepal.Length"]
unique(iris[,5])    # levels : ...
# unique -> 중복된 값은 제거하여 보여준다.(종류의 값이 있는지 확인할 수 있다.)
table(iris[,"Species"]) # 품종의 종류별 행의 개수 세기
# table -> 그룹을 나태내는 값이 포함된 자료형 -> 관측자(행) 이 있는지 몇개인지 출력(도수분포표)

# matrix, dataframe func
# row, col -> sum(), means()
colSums(iris[,-5])  # 열별 합계 -5열 제외
colMeans(iris[,-5]) # 열별 평균
rowSums(iris[,-5])  # 행별 합계
rowMeans(iris[,-5]) # 행별 평균

# 행과 열의 방향 전환
# 전치 행렬 (transpos matrix)
z<-matrix(1:20, nrow=4, ncol=5)
z
t(z) # 전치

# 조건에 맞는 행과 열의 값 출력
# 특정한 조건에 따른 값들을 추출 -> subset()
# subset() 데이터 프레임에서 만 적용 (매트릭스에 적용시 타입 변환후 가능)
IR.1 <- subset(iris, Species=="setosa")
IR.1
IR.2 <- subset(iris, Sepal.Length > 5.0 & Sepal.Width > 4.0)
IR.2[,c(2,4)]

# 매트릭스, 데이터 프레임 산술연산(col, row)
a<-matrix(1:20, 4, 5)
b<-matrix(21:40, 4, 5)
a; b;
2*a
b-5
2*a + 3*b

a+b

b-a
b/a
a*b

a<-a*3
b<-b-5
a; b;

# 매트릭스, 데이터 프레임 자료구조 확인
# 서로간의 형변환
# 자료 구조 확인 class()
class(iris)     # iris 데이터셋의 자료구조
class(state.x77)    # state.x77 matrix
is.matrix(iris) # matrix ? (return : boolean type)
is.data.frame(iris)
is.matrix(state.x77)
is.data.frame(state.x77)

# 자료구조 변환
# 매트릭스 -> 데이터 프레임 변환
state.x77
st<-data.frame(state.x77)
head(st)
class(st)

# 데이터 프레임 -> 매트릭스 as.matrix()
# 문자형 열은 제외하고 숫자형 열로 된 부분만 따로 데이터프레임 iris.m으로 변환 작업
# 매트릭스로 형변환시 매트릭스에 저장된ㄴ 모든 값들이 자료형이 동일해야 한다
iris
iris.m <- as.matrix(iris[, 1:4])
head(iris.m)
class(iris.m)

# 데이터프레임의 열 추출
# 열의 데이터 추출 
iris[,"Species"] # 결과 = 벡터, 매트릭스 O 데이터프레임 O
iris[,5]         # 결과 = 벡터, 매트릭스 O 데이터프레임 O
iris["Species"]  # 결과 = 데이터프레임 매트릭스 X 데이터프레임 O
iris[5]          # 결과 = 데이터프레임 매트릭스 X 데이터프레임 O
iris$Species     # 결과 = 벡터, 데이터프레임 O

apple<-matrix(1:20, nrow = 4, ncol = 5)
rownames(apple)<-c("testVara","testVarb","testVarc","testVard")
colnames(apple)<-c("Vara", "Varb", "Varc", "Vard", "Vare")
apple
class(apple)
zlog<-data.frame(apple)
zlog["Vara"]
zlog
