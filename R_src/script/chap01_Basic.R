# chap01_Basic.R : 주석문

# R 패키지 보기
dim(available.packages())	#18393	17

# R 패키지 목록 보기
available.packages()

# R Session 보기
sessionInfo()

# stringr 패키지 설치
install.packages("stringr")

# 설치된 패키지 확인
installed.packages()

# 패키지 메모리 로드
library(stringr)

# 현재 로드된 패키지 확인
search()

# 패키지 삭제
remove.packages("stringr")

# 기본 데이터셋 보기
data()

# 기본 데이터 셋으로 히스토그램 그리기
# 단계1 : 빈도수를 기준으로 히스토그램 그리기
hist(Nile, freq = TRUE) #hist 매개변수 freq 기본값 true

# 단계2 : 밀도를 기준으로 히스토그램 그리기
hist(Nile, freq = FALSE) #boolean 값은 대문자로 약속

# 단계3 : 단계 2의 결과에 분포 곡선을 추가
lines(density(Nile))

# 히스토그램을 파일로 저장하기
par(mfrow = c(1,1))
pdf("output/batch.pdf") # pdf 출력
hist(rnorm(20)) # 난수에 대한 히스토그램 그리기
dev.off() # 출력할 파일 닫기

# 스칼라(scalar) 변수 사용 예
var1 <- 0 #변수안에 하나의 값이 저장되있는 경우우
var1
var1 <- 1
var1
var1 <- 2
var1 

# '변수.멤버' 형식의 변수 선언 (자바와 달리 .은 연산자 아닌 변수명의 일부)
goods.code <- 'a001'
goods.name <- '냉장고'
goods.price <- 850000
goods.des <- '최고 사양, 동급 최고 품질'

# 벡터 변수 사용 예
names <- c("홍길동", "이순신", "유관순")
names

# 함수
sum(10, 20, 30, 40, 50)
sum(10, 20, 30, 40, NA) #NA(Not Available)
sum(10, 20, 30, 40, NA, na.rm = TRUE)
# sum(10, 20, 30, 40, NA, na.rm = T) 같은 결과
# TRUE는 T, FALSE는 F로 가능

# 자료형 확인
string <- "홍길동"
string

is.character(string) # TRUE
is.integer(string) # FALSE

int <- 20
x <- is.numeric(int)

x # TRUE

is.logical(x) # TRUE

# 문자 원소를 숫자 원소로 형변환 하기
x <- c(1, 2, "3")
x # "1" "2" "3"

# result <- x * 3 : Error
result <- as.numeric(x) * 3 # 강제 형변환 as.
result

# 복소수 자료 생성과 형변환
z <- 5.3 - 3i
Re(z) # 실수부
Im(z) # 허수부

is.complex(z) # TRUE
as.complex(5.3) # 5.3 + 0i

# 스칼라 변수의 자료형과 자료 구조 확인
mode(int) # "numeric"
mode(string) # "character"
x <- TRUE
mode(x) # "logical"

class(int) # "numeric"
class(string) # "character"
class(x) # "logical"

# 문자 벡터와 그래프 생성
gender <- c("man", "woman", "woman", "man", "man")
plot(gender) # error

# 요인형 변환
# as.factor() 함수 이용 범주(요인)형 변환
Ngender <- as.factor(gender)
Ngender
table(Ngender)

# Factor형 변수로 차트 그리기
plot(Ngender)
mode(Ngender) # "numeric"
class(Ngender) # "factor"
is.factor(Ngender) # "TRUE"

# Factor Nominal 변수
Ngender

# factor() 함수 이용 Factor 형 변환
args(factor)
Ogender <- factor(gender, levels = c('woman', 'man'), labels = c("여자", "남자"), ordered=T)
Ogender

# 순서없는 요인과 순서있는 요인형 변환
par(mfrow=c(1,2))
plot(Ngender)
plot(Ogender)

# 도움말 보기
i <- sum(1,2,3)
i

help(sum)
?sum

# 함수 파라메터 보기
args(sum)

# 함수 사용 예제 보기
example(sum)

# 작업 공간 지정
getwd()
# setwd("C:/workspace/boot_hrd_bigdata/R_src")
