%{
#include "output.hpp"
#include "output.tab.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
%}

%option yylineno
%option noyywrap
CRLF                (\r\n)
CR                  (\r)
LF                  (\n)
TAB                 (\t)
%%

void                                                                  {return (VOID)}
int                                                                   {return (INT)}
byte                                                                  {return (BYTE)}
b                                                                     {return (B)}
bool                                                                  {return (BOOL)}
and                                                                   {return (AND)}
or                                                                    {return (OR)}
not                                                                   {return (NOT)}
true                                                                  {return (TRUE)}
false                                                                 {return (FALSE)}
return                                                                {return (RETURN)}
if                                                                    {return (IF)}
else                                                                  {return (ELSE)}
while                                                                 {return (WHILE)}
break                                                                 {return (BREAK)}
continue                                                              {return (CONTINUE)}
;                                                                     {return (SC)}
,                                                                     {return (COMMA)}
\(                                                                    {return (LPAREN)}
\)                                                                    {return (RPAREN)}
\{                                                                    {return (LBRACE)}
\}                                                                    {return (RBRACE)}
=                                                                     {return (ASSIGN)}
==|!=|>=|<=|<|>                                                       {return (RELOP)}
\+|-|\*|\/                                                            {return (BINOP)}
[a-zA-Z][a-zA-Z0-9]*                                                  {return (ID)}
0|[1-9][0-9]*                                                         {return (NUM)}
\"([^\n\r\"\\]|\\[rnt"\\])+\"                                         {return (STRING)}
[{CR}{CRLF}{LF}{TAB}]                                                 {return (epsilon)}
//[^\r\n]*[\r\n|\r\n]?                                                {return (epsilon)}
<<EOF>>                                                               exit(0);
.                                                                     output::errorLex(yylineno);
%%
