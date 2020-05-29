#01
cnt<-0
sum<-0
for (i in 1:100) {
    if (i %% 3 == 0) {
        sum = sum + i
        cnt = cnt + 1
    }
}
cnt
sum

#02
result=0
for (i in 102:199) {
    if ((i%%3) == 0 & (i%%4) == 0) {
        result = result + 1
    }
}
result
inf <- matrix(1:result, nrow = 1, ncol = result)
cnt<-1
for (i in 102:199) {
    if ((i %% 3) == 0 & (i %% 4) == 0) {
        inf[1, cnt]<-i
        cnt = cnt + 1
    }
}
inf
#03
i<-2
x<-24
y<-0
f<-FALSE
while(x != 1 | i < x)
{
    if (x %% i == 0)
    {
        print(i)
        if (f == FALSE) {
            y = y + 1
        }
        x = x / i
        f<-TRUE
    } else {
        i = i + 1
        f<-FALSE
    }
}
print(y)
#01-04
n_fac<-10
rst_fac<-1
for (i in 1:n_fac) {
    rst_fac=rst_fac*i
}
print(rst_fac)

#02
for (x in 1:9)
{
    cat("9 * ",x,"=",x*9,"\n")
}
#03
i<-1
while(i<10)
{
    cat("8 * ", i, "=", i*8,"\n")
    i = i + 1
}

#04 X
for (i in 1:100) {
    if (i%%3 == 0)
    {
        cat("*","")
    }
    cat(i,"")
}

#05
CheckPrime = function(x) {
    i<-2
    while(i < sqrt(x))
    {
        if (x %% i == 0) {
            return (FALSE)
        }
        i <= i + 1
    }
    return (TRUE)
}
for (i in 3:999) {
    if (CheckPrime(i))
    {
        cat(i,"")
    }
}

#06
n_fib <-c(0,1,0)
for (i in 1:39)
{
    if (i == 1 | i == 2)
    {
        cat(n_fib[i], "")
    } else {
        n_fib[(i-1)%%3 + 1] <-n_fib[(i-3)%%3 + 1] + n_fib[(i-2)%%3 + 1]
        cat (n_fib[(i-1)%%3 + 1], "")
    }
}

#07
apply(iris[,-5], 1, sum)
#-02
apply(iris[,-5], 2, max)

#08
apply(mtcars, 2, sum)
#-02
apply(mtcars, 2, max)
#-03
apply(mtcars, 2, sd)

#09
lgm = function(x, y)
{
    check<-0
    infer<-3
    ifelse(x>y, r<-c(x,y,1), r<-c(y,x,1))

    while(r[((infer-2)%%3) + 1] != 0) {
        check<-as.integer(r[(infer-3)%%3 + 1] / r[(infer-2)%%3 + 1])
        r[(infer-1)%%3 + 1]<-r[(infer-3)%%3 + 1] - (check*r[(infer-2)%%3 + 1])
        infer<-infer + 1
    }
    return (r[((infer-3)%%3) + 1])
}
lgm(128, 36)
lgm(10, 8)
lgm(10, 20)

#10
maxmin = function(x)
{
    return (list(max=max(x), min=min(x)))
}
v1<-c(7,1,2,8,9)
result <- maxmin(v1)
result$max; result$min
result<-maxmin(iris[,1])
result$max; result$min
#11
weight <- c(69, 50, 55, 71, 89, 64, 59, 70, 71, 80)
#01
which.max(weight)
#02
which.min(weight)
#03
which(weight > 61 & weight < 69)
#04
weight.2<-weight[which(weight <= 60)]
print(weight.2)

#12
#12-01
iris[which.max(iris[,"Petal.Length"]),]
#12-02
iris[which(iris$Petal.Width > 0.3 & iris$Petal.Width < 0.4),]
