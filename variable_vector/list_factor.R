ds<-c(90,85,75,84)
my.info<-list(name='TOP',age=60,status=TRUE, score=ds)
my.info
my.info[[1]]
my.info$name
my.info[[4]]


bt<-c('A','B','B','O','AB','A')
bt.new<-factor(bt)
bt
bt.new
bt.new[5]
levels(bt.new)
as.integer(bt.new)
bt.new[7]<-'B'
bt.new[8]<-'C'  # level안에 있는 값들한에 집어 늘수 있다.
bt.new

namin<-c("love", "Naju", "boys", "woon")
namin.new<-factor(namin)
namin
namin.new
namin.new[3]
levels(namin.new)
as.integer(namin.new)
namin.new[5]<-"love"
namin.new[5]