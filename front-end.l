D                       [0-9]
L                       [a-zA-Z_]

%{
#include <stdio.h>
#include "structfe.tab.h"
int yylineno = 1;
%}

%option noyywrap
%%
"else"                      { return ELSE; }
"extern"                    { return EXTERN; }
"for"                       { return FOR; }
"if"                        { return IF; }
"int"                       { return INT; }
"return"                    { return RETURN; }
"sizeof"                    { return SIZEOF; }
"struct"                    { return STRUCT; }
"void"                      { return VOID; }
"while"                     { return WHILE; }

{L}({L}|{D})*               { yylval.name = strdup(yytext); return IDENTIFIER; }
{D}+                        { yylval.number = strdup(yytext); return CONSTANT; }

"/*"([^*]|(\*+[^*/]))*\*+\/ {  }
"//"([^\n\r]*)[\n\r]        {  }


"->"                    { return PTR_OP; }
"&&"                    { return AND_OP; }
"||"                    { return OR_OP; }
"<="                    { return LE_OP; }
">="                    { return GE_OP; }
"=="                    { return EQ_OP; }
"!="                    { return NE_OP; }

[ \t\v\f]             {  }
[\n\r]                { yylineno++; }
.                       { return yytext[0]; }
%%