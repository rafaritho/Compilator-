parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: PROGRAM LCURLY field_decl+ method_decl+ RCURLY;

field_decl: field | LBRACKET int_literal RBRACKET field;

type: BOOLEAN | INTVAR;
id: ID;
field: (COMMA (type id | type id LBRACKET int_literal RBRACKET))* SEMICOLON;
int_literal: INTLITERAL; 
literal: int_literal | CHARLITERAL | BOOLEANLITERAL;
decimal_literal: INT INT+; 

method_decl: (type | VOID) id LP (type id (COMMA type id)*)? RP block;
block: LCURLY var_decl+ statement+ RCURLY;
var_decl: type id(COMMA type id)* SEMICOLON;

statement: location assign_op expr SEMICOLON | method_call SEMICOLON |  IF LP expr RP block (ELSE block)? |  
FOR id EQUAL expr COMMA expr block | RETURN (expr)? SEMICOLON | BREAK SEMICOLON | CONTINUE SEMICOLON | block;

location: id | id  LBRACKET expr RBRACKET;
assign_op:  EQUAL | PLUSEQUAL | MINUSEQUAL;
expr: location | method_call | literal | expr bin_op expr | MINUS expr | EXCLAMATION expr | LP expr RP; 

method_call: method_name LP  (expr (COMMA expr)*)? RP | CALLOUT LP string_literal (COMMA callout_arg (COMMA callout_arg)*)? RP;

method_name: id;
callout_arg: expr | string_literal;
string_literal: CHARLITERAL+;
bin_op: OPERADOR;