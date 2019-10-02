lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';
LBRACKET: '[';
RBRACKET: ']';
LP: '(';
RP: ')';

PROGRAM: 'Program';
BOOLEAN: 'boolean';
INTVAR: 'int';
COMMA: ',';
SEMICOLON: ';';
VOID: 'void';
IF: 'if';
EQUAL: '=';
PLUSEQUAL: '+=';
MINUSEQUAL: '-=';
MINUS: '-';
ELSE: 'else';
FOR: 'for';
RETURN: 'return';
BREAK: 'break';
CONTINUE: 'continue';
EXCLAMATION: '!';
CALLOUT: 'callout';
CLASS: 'class';

CYMBALS: '||' | '|' | ':';

WS : (' ' | '\n' | '\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

BOOLEANLITERAL: 'true' | 'false';
INTLITERAL	: INT+ | HEXADECIMAL;
STRINGLITERAL: S; 
ID : I;
CHARLITERAL: CHAR | BACKSLASH;

fragment S: '\"' (C|WS|BACKSTRING|ASCII)+ '\"';

fragment CHAR : '\'' C '\''; 
fragment BACKSLASH: '\'' ('\\'B  | '\\\\' | '\\"' | '\\\'') '\'';
fragment BACKSTRING: '\\n' | '\\t' | '\\\\' | '\\"' | '\\\'';
fragment ESC :  '\\' ('n'|'"');

fragment INT: [0-9]+; 
fragment C: [a-zA-Z] | INT; 
fragment B: [nt]; 

HEXADECIMAL: '0x'H+;
fragment H: INT+ | [a-fA-F];

fragment I: (C | C U | U C)+; 
fragment U: '_';

fragment ASCII: ',' | ';' | '||' | '|' | '.' | ':' | '?' ;
OPERADOR: '+' | '*' | '<' | '<=' | '>=' | '!=' | '&&' | '>' | '<' | '==';
