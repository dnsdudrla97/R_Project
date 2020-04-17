maxVar<-function(x, y, z) {
    if (x > y) max<-x
    else max<-y
    if (max > z) return (max)
    else return (z)
}