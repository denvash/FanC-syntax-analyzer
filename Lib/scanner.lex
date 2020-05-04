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
printableComment    ({printableWoSlash}|[\x2F]+{printableWoAsterisk})
badNestedComment    ((\/\*)([\x09\x0A\x0D\x20-\x2E\x30-\x7E]|[\x2F]+[\x09\x0A\x0D\x20-\x29\x2B-\x7E])*(\/\*))
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
(                                                                     {return (LPAREN)}
)                                                                     {return (RPAREN)}
{                                                                     {return (LBRACE)}
}                                                                     {return (RBRACE)}
=                                                                     {return (ASSIGN)}
==|!=|>=|<=|<|>                                                       {return (RELOP)}
[a-zA-Z][a-zA-Z0-9]*                                                  {return (BINOP)}
\+|-|\*|\/                                                            {return (ID)}
0|[1-9][0-9]*                                                         {return (NUM)}
\"([^\n\r\"\\]|\\[rnt"\\])+\"                                         {return (STRING)}
<<EOF>>                                                               exit(0);
.                                                                     printf("Error %s\n", yytext);exit(0);
%%


