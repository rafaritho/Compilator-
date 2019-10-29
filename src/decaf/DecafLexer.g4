lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

IF: 'if';

ELSE: 'else';

CLASS: 'class';

INTVAR: 'int';

VOID: 'void';

FOR: 'for';

BREAK: 'break';

CALLOUT: 'callout';

CONTINUE: 'continue';

BOOLEAN: 'boolean';

RETURN: 'return';

BOOLEANLITERAL: 'true' | 'false';

LCURLY: '{';

RCURLY: '}';

LBRACKET: '[';

RBRACKET: ']';

LP: '(';

RP: ')';

OU: '||';

EXCLAMATION: '!';

EQUAL: '=';

PLUS: '+';

MINUS: '-';

MULT: '*';

E: '&&';

IG: '==';

DIV: '/';

MOD: '%';

PLUSEQUAL: '+=';

MINUSEQUAL: '-=';

SEMICOLON: ';';

COMMA: ',';

DOIS_PONTOS: ':';

MENORQ: '<';

MAIORQ: '>';

MAIORIGUAL: '>=';

MENORIGUAL: '<=';

DIFERENTE: '!=';

ID: (LET|ESPC)(LET|ESPC|INT)*;

WS_: [ \t\r\n]+ -> skip;

SL_COMMENT	: '//' (~'\n')* '\n' -> skip;

CHAR: '\'' (ESC|LET|INT) '\'';

STRING: '\"' (WS_|ESC|LET|INT|SIM)*'\"';

HEXLITERAL:   '0x'('a'..'f'|'A'..'F'|INT)+;

ERRO_HEX: '0x';

NUM: INT(INT)*;

LET: LETRAS(LETRAS)*;

fragment
ESC:  '\\' ('n'|'"'|'t'|'\\');

fragment
SIM: ( '\\\"'|'.'|','|'?'|'\\\''|':'|'%');

fragment
INT: ('0'..'9');

fragment
ESPC: ('_');

fragment
LETRAS: ('a'..'z'|'A'..'Z');