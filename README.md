# 프로젝트 정보

## 심프리터(Simpreter)

심프리터는 **sim**ple + inter**preter**의 합성어로 간단하고 직관적인 문법을 가진 인터프리터이다.

## 제작자 정보

정보융합공학과
202488548
조대영

## 배포 정보

[github 바로가기](https://github.com/DaeyeongCho/simpreter)


# 시작 가이드

## 요구사항

본 인터프리터는 다음 요구사항에서 작성됨

**Openjdk**: openjdk 1.8.0_41   
**JFlex**: JFlex 1.9.1   
**CUP**: v0.11b 20160615   


## 설치 및 실행

1. 자바(Java) 다운로드 및 환경 변수 설정
2. JFLEX 및 CUP 다운로드 및 환경 변수 설정
3. /bin 디렉터리의 3개 배치(bat) 파일을 jflex의 bin 폴더에 추가
4. 터미널에서 현재 폴더로 이동 후 아래 5개 명령어 입력

```shell
$jflex simple.flex
$cup expr.cup
$javac sym.java
$cupcc Lexer.java parser.java Main.java
$cuprun Main
```

[OpenJDK 바로가기](https://openjdk.org/)   
[JFlex 바로가기](https://www.jflex.de/)   
[CUP 바로가기](https://www2.cs.tum.edu/projects/cup/)


# 주요 기능

## 실행

```shell
$cuprun Main
```

## 문법

### 사칙 연산

prefix 방식이다.   
**문법**: ><피연산자> <연산자> <피연산자>   
단항 연산과 괄호를 통한 우선순위를 지원한다.   

**예시**
```
10
20
10 + 20 - 30
10 + -20 - -30
10 * 20 / 30
30 % 8 / 2
10 + 20 * 30
(10 + 20) * 30
(10 + (20 - -30)) * 40
```

### 변수 선언

**문법**: >define <변수명> <값>   

**예시**
```
define a 10
a
define b 20
a + b
define c 30
a + -b - -c
(a + b) / (c - 40)
```

### 조건문

**문법**: >if <조건>, <참값>, <거짓값>   
if문 이후 조건, 참값, 거짓값을 쉼표(,)로 구분한다.   
조건연산자는 <, >, <=, >=를 지원하며, 0은 거짓 나머지 숫자는 참이다.   

**예시**
```
if 10 < 20, 100, 200
if 30 >= 40, 10 + 20, 30 - 40
if 0, 10, 20
if 10, 10, 20
if a < b, a * b, a / c
```

### switch~case문

**문법**: switch case <조건>, <값> case <조건>, <값> ···   
switch문 이후 case와 조건, 값을 쉼표(,)로 구분하여 작성한다.
왼쪽의 case부터 시작하여 처음 참인 조건을 만날때까지 비교하여 참을 만나면 그 값을 출력하고 switch문이 종료된다.   
만약 마지막까지 참값이 없으면 None을 출력한다.

**예시**
```
switch case 10 > 20, 100 case 30 < 40, 200 case 50 < 60, 300
switch case 0, 10 case 0, 20, case 0, 30
switch case a >= 30, a + 30 case b >= 30, b + 30 case c >= 30, c + 30 case d >= 30, d + 30
```


## 종료

```
> exit
```