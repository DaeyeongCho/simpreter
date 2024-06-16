@echo off
REM Please adjust the paths JFLEX_HOME and JAVA_HOME to suit your needs
REM (please do not add a trailing backslash)

if not defined JFLEX_HOME set JFLEX_HOME=C:\JFLEX
if not defined JFLEX_VERSION set JFLEX_VERSION=1.9.1

REM only needed for JDK 1.1.x:

set CUP_JAR=%JFLEX_HOME%\lib\java-cup-11b.jar
set CLPATH=%JAVA_HOME%\lib\classes.zip;%JFLEX_HOME%\lib\jflex-full-%JFLEX_VERSION%.jar

javac -cp %CUP_JAR%;. %*

