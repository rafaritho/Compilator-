lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

LCURLY: '{';
RCURLY: '}';
LBRACKET: '[';
RBRACKET: ']';
LP: '(';
RP: ')';
CLASS: 'class';
BOOLEAN: 'boolean';
INTVAR: 'int';
VOID: 'void';
IF: 'if';
ELSE: 'else';
FOR: 'for';
RETURN: 'return';
BREAK: 'break';
CALLOUT: 'callout';
CONTINUE: 'continue';
BOOLEANLITERAL: 'true' | 'false';
EXCLAMATION: '!';
OR: '||';
EQUAL: '=';
PLUS: '+';
MINUS: '-';
MULT: '*';
AND: '&&';
EQUALS: '==';
DIV: '/';
MOD: '%';
PLUSEQUAL: '+=';
MINUSEQUAL: '-=';
SEMICOLON: ';';
COMMA: ',';
COLON: ':';
LESS: '<';
BIGGER: '>';
LESSEQ: '>=';
BIGGEREQ: '<=';
DIFFERENT: '!=';
ID: (C|UNDERLINE)(C|UNDERLINE|INT)*;
WS_: [ \t\r\n]+ -> skip;
SL_COMMENT	: '//' (~'\n')* '\n' -> skip;
CHAR: '\'' (ESC|C|INT) '\'';
STRING: '\"' (WS_|ESC|C|INT|CYMBALS)*'\"';
HEXLITERAL: '0x'('a'..'f'|'A'..'F'|INT)+;
ERRO_HEX: '0x';
NUM: INT(INT)*;
C: AZ(AZ)*;
fragment ESC:  '\\' ('n'|'"'|'t'|'\\');
fragment CYMBALS: ( '\\\"'|'.'|','|'?'|'\\\''|':'|'%');
fragment INT: ('0'..'9');
fragment UNDERLINE: ('_');
fragment AZ: ('a'..'z'|'A'..'Z');