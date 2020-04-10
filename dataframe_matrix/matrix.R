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