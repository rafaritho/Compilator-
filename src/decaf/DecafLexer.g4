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
BOOLEAN: 'boolean';
BREAK: 'break';
CALLOUT: 'callout';
CLASS: 'class';
CONTINUE: 'continue';
ELSE: 'else';
FALSE: 'false';
INT: 'int';
RETURN: 'return';
TRUE: 'true';
VOID: 'void';


ID  :
  ('a'..'z' | 'A'..'Z')+;

WHITESPACE : (' ' | '\n' ) -> skip;

COMENTARIO : '//' (~'\n')* '\n' -> skip;

CHARLITERAL : '\'' (ESC|~'\'') '\'';
STRING : '"' (ESC|~'"')* '"';

fragment
ESC :  '\\' ('n'|'"');
