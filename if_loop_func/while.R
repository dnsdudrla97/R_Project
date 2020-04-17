# while
sum <- 0
i <- 1
while (i <= 100) {
    sum <- sum + i
    i <- i+1
}
print(sum)

# break
sum<-0
for (i in 1:10) {
    sum <-sum+i
    if (i==5) break
}
sum

# next
sum<-0
for (i in 1:10) {
    if (i%%2 == 0) next
    sum<-sum+i
}
sum