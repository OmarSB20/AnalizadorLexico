package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]
D=[0-9]
white=[ ,\t,\r\n]
O=[-!|#$%&()=?¿;:,.+*<>]
%{
    public String lexeme;
%}
%%

{white} {/*Ignore*/}
"//"( {L} | {D} | {O} | [ ])+"//" {lexeme=yytext(); return Comentarios;}
("<" | ">" | ( "=" | "<" | ">") =) {lexeme=yytext(); return Relacionales;}
"," | ":" {lexeme=yytext(); return Especiales;}
"&" | "|" | "~" {lexeme=yytext(); return Logicos;}
"#"{L}( {L} | {D} | "_" )* {lexeme=yytext(); return Identificadores;}
{D}+ {lexeme=yytext(); return Enteros;}
"\""{L}*"\"" {lexeme=yytext(); return Texto;}
"Program" | "begin" | "end" | "else" | "if" | "boolean" | "integer" | "char" | "input" |
 "repeat" | "then" | "true" | "while" | "do" | "until" | "var" | "false" | 
"output" {lexeme=yytext(); return Palabras_R;}
"-" | "+" | "/" | "." {lexeme=yytext(); return Op_a;}
"=" {lexeme=yytext(); return Asignacion;}
";" {lexeme=yytext(); return Delimitador;}
"(" {lexeme=yytext(); return Par_a;}
")" {lexeme=yytext(); return Par_c;}
"{" {lexeme=yytext(); return Llave_a;}
"}" {lexeme=yytext(); return Llave_c;}
 . {return ERROR;}