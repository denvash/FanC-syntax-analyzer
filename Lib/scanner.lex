%{
#include "parser.hpp"
#include "parser.tab.hpp"
#include "output.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define _(TOKEN) {return TOKEN;}
%}

%option noyywrap
%option yylineno
%%

void                                                                  _(VOID);
int                                                                   _(INT);
byte                                                                  _(BYTE);
b                                                                     _(B);
bool                                                                  _(BOOL);
and                                                                   _(AND);
or                                                                    _(OR);
not                                                                   _(NOT);
true                                                                  _(TRUE);
false                                                                 _(FALSE);
return                                                                _(RETURN);
if                                                                    _(IF);
else                                                                  _(ELSE);
while                                                                 _(WHILE);
break                                                                 _(BREAK);
continue                                                              _(CONTINUE);
;                                                                     _(SC);
,                                                                     _(COMMA);
\(                                                                    _(LPAREN);
\)                                                                    _(RPAREN);
\{                                                                    _(LBRACE);
\}                                                                    _(RBRACE);
=                                                                     _(ASSIGN);
==|!=|>=|<=|<|>                                                       _(RELOP);
\+|-|\*|\/                                                            _(BINOP);
[a-zA-Z][a-zA-Z0-9]*                                                  _(ID);
0|[1-9][0-9]*                                                         _(NUM);
\"([^\n\r\"\\]|\\[rnt"\\])+\"                                         _(STRING);
[(\r)(\n)(\r\n)(\t)]                                                  /* ignore */
"//"[^\r\n]*[\r|\n|\r\n]?                                             /* ignore */
<<EOF>>                                                               exit(0);
.                                                                     output::errorLex(yylineno);
%%
