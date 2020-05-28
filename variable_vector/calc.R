d<-c(1, 2, 3, 4, 5, 6, 7, 8, 9)
d
d>=5;
d[d>5];
sum(d>5);
sum(d[d>5])
condi <- d > 5 & d < 8
sum(condi)
d[condi]

x<-c(1,2,3)
y<-c(4,5)
cont <- c(x,y)
names(cont)<-c("Namin1", "Namin2", "Namin3","Namin4","Namin5")
cont
#04
#01
25+99
#02
456-123
#03
2*(3+4)
#04
(3+5*6)/7
#05
(7-4)*3
#06
210+35
#07
1256%%7
#08
184%%5
#09
1976%%24
#10
16*25+186*5-67*22

# 0403 pratice 
# 02
a<-5
a
b<-4
c<-sum(a, b)
c

#03
pi=3.14;
d=2;
s<-c(10, 12, 15)
result<-c()
for (i in 1:3) {
   result[i]=d*pi*s[i]
   # print(result)
}
result[1]

#04
x<-6
y=2*x^2+5*x+10
y
x<-8
y=2*x^2+5*x+10
y
x<-10
y=2*x^2+5*x+10
y

#05
#val.b 변수에 해당 값이 NULL 이다.

#06
vc.1<-c(95,86,47,55,68)
vc.1

#07 seq(시작, 종료, 간격)
vc.2<-seq(100,200,2)
vc.2

#08 rep(반복대상값, 반복횟수) // 반복횟수 times=N
vc.3<-c(rep(TRUE, times=20))
vc.3

#09
#9-1
d<-c(seq(100, 200))
d
#9-2
d[10]

#9-3
d<-seq(d[101],d[91],-1)
d

#9-4
condi<-d%%2
d[condi == 1]

#9-5
d[d%%3==0]

#9-6
d.20<-d[1:20]
d.20

#9-7
d.20[-5]
#9-8
d.20[-c(5, 7, 9)]


#10
absent<-c(10, 8, 14, 15, 9, 10, 15, 12, 9, 7, 8, 7)
names(absent)<-c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")
absent

absent["MAY"]

absent[c("JUL", "SEP")]

sum(absent[(c(1:6))])

mean(absent[(c(7:12))])


#11
#11-1
d1<-1:50
d2<-51:100
print(d1)
print(d2)
#11-2
print(length(d2))
#11-3
d1+d2
d2-d1
d1*d2
d2/d1
#11-4
sum(d1)
sum(d2)
#11-5
d1_sum<-sum(d1)
d2_sum<-sum(d2)
sum(d1_sum, d2_sum)

#11-6
max(d2)
min(d2)

#11-7
d1_mean<-mean(d1)
d2_mean<-mean(d2)
sum(d1_mean, d2_mean)
#11-8
sort(d1,T)
#11-9
t<-sort(d1)
t
t2<-sort(d2)
t2
d3<-c(t[c(1:10)], t2[c(1:10)])
d3

#12
v1=51:90
v1
#12-1
v1[c(v1<60)]
#12-2
length(v1[c(v1<70)])
#12-3
sum(v1[c(v1>65)])
#12-4
v1[c(60 < v1 & v1 < 73)]
#12-5
v1[c(65 > v1 | v1 > 80)]
#12-6
v1[c(v1 %% 7 == 3)]
#12-7
v1[c(v1 %% 7 == 0)] = 0
v1[c(v1 %% 7 == 0)]

v1=51:90    #reset
#12-8
sum(v1[c(v1%%2==0)])
#12-9
v1[c(v1%%2==1 | v1 > 80)]
#12-10
v1[c(v1%%3==0 & v1%%5==0)]
#12-11
v1<-v1[c(v1%%2==0)]* 2
v1
#12-12
v1=51:90    #reset
v1
v1[v1%%7 != 0]
v1[-c(v1%%7 == 0)]












