package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]
D=[0-9]+
white=[ ,\t,\r,\n]+
O=[-!|#$%&()=?¿;:,.+*<>]
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

{white} {/*Ignore*/}
"//"( {L} | {D} | {O} | [ ])+"//" {/*Ignore*/}
("<" | ">" | ( "=" | "<" | ">") =) {return new Symbol (sym.Op_relacional, yychar, yyline, yytext());}
"," {return new Symbol (sym.Coma, yychar, yyline, yytext());}
":" {return new Symbol (sym.Asignacion, yychar, yyline, yytext());}
"&" | "|" | "~" {return new Symbol (sym.Op_logico, yychar, yyline, yytext());}
"#"{L}( {L} | {D} | "_" )* {return new Symbol (sym.Identificador, yychar, yyline, yytext());}
{D}+ {return new Symbol (sym.Numero, yychar, yyline, yytext());}
"\""{L}*"\"" {return new Symbol (sym.Cadena, yychar, yyline, yytext());}
"Program" {return new Symbol (sym.Program, yychar, yyline, yytext());}
"begin" {return new Symbol (sym.Begin, yychar, yyline, yytext());}
"end" {return new Symbol (sym.End, yychar, yyline, yytext());}
"else" {return new Symbol (sym.Else, yychar, yyline, yytext());}
"if" {return new Symbol (sym.If, yychar, yyline, yytext());}
"char" | "string" {return new Symbol (sym.T_datoS, yychar, yyline, yytext());}
"integer" | "real" {return new Symbol (sym.T_datoN, yychar, yyline, yytext());}
"boolean" {return new Symbol (sym.T_datoB, yychar, yyline, yytext());}
"input" {return new Symbol (sym.Input, yychar, yyline, yytext());}
"repeat" {return new Symbol (sym.Repeat, yychar, yyline, yytext());}
"then" {return new Symbol (sym.Then, yychar, yyline, yytext());}
"true" | "false" {return new Symbol (sym.Op_booleano, yychar, yyline, yytext());}
"while" {return new Symbol (sym.While, yychar, yyline, yytext());}
"do" {return new Symbol (sym.Do, yychar, yyline, yytext());}
"until" {return new Symbol (sym.Until, yychar, yyline, yytext());}
"var" {return new Symbol (sym.Var, yychar, yyline, yytext());}
"output" {return new Symbol (sym.Output, yychar, yyline, yytext());}
"++" | "--" {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}
"-" {return new Symbol (sym.Resta, yychar, yyline, yytext());}
"+" {return new Symbol (sym.Suma, yychar, yyline, yytext());}
"/" {return new Symbol (sym.Division, yychar, yyline, yytext());}
"*" {return new Symbol (sym.Multiplicacion, yychar, yyline, yytext());}
"=" {return new Symbol (sym.Igual, yychar, yyline, yytext());}
";" {return new Symbol (sym.P_coma, yychar, yyline, yytext());}
( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}
( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}
 . {return new Symbol (sym.ERROR, yychar, yyline, yytext());}
