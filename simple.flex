import java_cup.runtime.*;

%%

%class Lexer
%line
%column
%cup

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

newline = \r|\n|\r\n
whitespace = {newline} | [ \t\f]
number = [0-9]+
identifier = [a-zA-Z_][a-zA-Z0-9_]*

%%

"+" { return symbol(sym.PLUS); }
"-" { return symbol(sym.MINUS); }
"*" { return symbol(sym.TIMES); }
"/" { return symbol(sym.DIVIDE); }
"%" { return symbol(sym.MOD); }
"(" { return symbol(sym.LPAREN); }
")" { return symbol(sym.RPAREN); }
"define" { return symbol(sym.DEFINE); }
"if" { return symbol(sym.IF); }
"switch" { return symbol(sym.SWITCH); }
"case" { return symbol(sym.CASE); }
"," { return symbol(sym.COMMA); }
"<" { return symbol(sym.LT); }
">" { return symbol(sym.GT); }
"<=" { return symbol(sym.LE); }
">=" { return symbol(sym.GE); }
{number} { return symbol(sym.INT, new Integer(yytext())); }
{identifier} { return symbol(sym.ID, yytext()); }
{whitespace} {  }
<<EOF>> { return symbol(sym.EOF); } 
. { throw new Error("Illegal character <"+yytext()+">"); }
