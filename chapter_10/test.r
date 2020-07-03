install.packages("multilinguer")
library(multilinguer)
install_jdk()
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")

Sys.setenv(JAVA_HOME='C:/Program Files (x86)/Java/jre1.8.0_251')  # 설치한 JAVA version에 따라 달라집니다

install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"), force=TRUE)
library(KoNLP) #최종적으로 "KoNLP" 패키지를 불러옵니다

buildDictionary(ext_dic = "woorimalsam")  # "woorimalsam" dic을 불러옵니다


# devtools::install_github('haven-jeon/NIADic/NIADic', build_vignettes = TRUE)
install.packages('C:/Users/Younsle/Downloads/NIADic_0.0.1.tar.gz', repos = NULL, type="source")
# Sys.getenv('JAVA_HOME')
useNIADic()  # "NIADic" dic을 불러옵니다
#--------------------------- re-----------------
library(wordcloud)
library(RColorBrewer)

setwd("C:/Users/Younsle/Desktop/R/chapter_10")
text<-readLines("security.txt", encoding="UTF-8") #파일 읽기
View(text)
# buildDictionary(ext_dic="woorimalsam") # 우리말씀
pal2<-brewer.pal(8, "Dark2")
noun<-sapply(text, extractNoun, USE.NAMES=F) #명사 추출
noun

#단어 빈도수 높은 단어 막대그래프 작성
noun2<-unlist(noun) #추출된 명사 통합
wordcount<-table(noun2) #단어 빈도수 계산
temp<-sort(wordcount, decreasing = T)[1:10] #빈도수 높은 단어 10개 추출
temp

temp<-temp[-1] # 공백 단어 제거

barplot(temp, # 막대 그래프 작성
    names.arg=names(temp), # 막대 이름을 단어로 표시
    col="lightblue", #막대 색상 지정
    main="빈도수 높은 단어",
    ylab="단어 빈도수")

wordcloud(
    names(wordcount),   # 단어들 (워드클라우드 상에 표시할 단어)
    freq=wordcount,     # 단어들 빈도 (워드클라우드 상에 표시할 단어 빈도)
    scale=c(6,0.7),     # 단어들 폰트 크기 (6:폰트크기, 0.7:폰트의 최소크기)
    min.freq=3,         # 단어의 최소 빈도 (빈도수가 3이상인 단어)
    random.order=F,     # 단어의 출력 위치 (단어가 표될 위치를 지정, T는 단어의 표시 위치를 무작위로 지정, F는 빈도수가 높은 단어일 수록 중앙에)
    rot.per=.1,         # 90도 회전 단어 비율 (단어를 표시할 때 세로 방향으로 표시할 단어의 비율을 지정한다., .1 10%이다.)
    colors=pal2)        # 단어색(빈도수에 따라 pal2에 있는 색으로 단어의 색을 지정)
)
#워드클라우드 수정
#빈도수는 높은데 워드클라우드에 없으면 사용자 사전에 추가
buildDictionary(ext_dic="woorimalsam",
    user_dic=data.frame("정치", "ncn"),
    replace_usr_dic=T)
noun<-sapply(text, extractNoun, USE.NAMES=F)
noun2<-unlist(noun)

# 무의미한 단어 제거
noun2<-noun2[nchar(noun2)>1] #1글자 단어 제거
noun2<-gsub("the","",noun2)
noun2<-gsub("of","",noun2)
noun2<-gsub("a","",noun2)
noun2<-gsub("an","",noun2)
noun2<-gsub("is","",noun2)
noun2<-gsub("for","",noun2)
noun2<-gsub("to","",noun2)
noun2<-gsub("he","",noun2)
noun2<-gsub("she","",noun2)
noun2<-gsub("and","",noun2)
noun2<-gsub("will","",noun2)
noun2<-gsub("that","",noun2)
noun2<-gsub("this","",noun2)
noun2<-gsub("it","",noun2)
noun2<-gsub("we","",noun2)
noun2<-gsub("would","",noun2)
noun2<-gsub("on","",noun2)
wordcount<-table(noun2)
wordcloud(
    names(wordcount), 
    freq=wordcount,
    scale=c(10,0.7),
    min.freq=2,
    random.order=F,
    rot.per=.1,
    colors=pal2
)

