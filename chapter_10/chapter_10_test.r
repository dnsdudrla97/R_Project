install.packages(c('wordcloud', 'KoNLP', 'RColorBrewer'))
install.packages("multilinguer")
install.packages(c("stringr", "hash", "tau", "Sejong", "RSQLite", "devtools"), type = "binary")
install.packages("rJava")
install.packages("bit64")

install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

Sys.setenv(JAVA_HOME='C:/Program Files/Java/jdk-12.0.1')

library(wordcloud)
library(KoNLP)
library(RColorBrewer)

library(multilinguer)
install_jdk()

library(rJava)

useSejongDic() 

setwd("C:/Users/Younsle/Desktop/R/chapter_10")
text<-readLines("KakaoTalk_20200702_1929_08_808_group.txt") #파일 읽기
View(text)
buildDictionary(ext_dic="woorimalsam") # 우리말씀
pal2<-brewer.pal(8, "Dark2")
noun<-sapply(text, extractNoun, USE.NAMES=F)
noun



