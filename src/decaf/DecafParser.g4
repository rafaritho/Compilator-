parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS ID LCURLY field_decl* method_decl* RCURLY;

field_decl: (type_id(COMMA type_id)* | type_id LBRACKET int_literal RBRACKET (COMMA type_id LBRACKET int_literal RBRACKET)*) SEMICOLON;

method_decl: (type | VOID) ID LP (type_id(COMMA type_id)*)? RP block;

block: LCURLY var_decl* statement* RCURLY;

var_decl: type_id (COMMA ID)* SEMICOLON;

type_id: type ID (COMMA ID)*;

type: INTVAR | BOOLEAN;

statement: location assing_op expr SEMICOLON
		| method_call SEMICOLON
		| IF LP expr RP block (ELSE block)? 
		| FOR ID EQUAL expr COMMA expr block 
		| RETURN expr? SEMICOLON
		| BREAK SEMICOLON
		| CONTINUE SEMICOLON
		| block
	 	;

assing_op: EQUAL | PLUSEQUAL | MINUSEQUAL;

method_call: method_name LP(expr (COMMA expr)*)? RP | CALLOUT LP STRING (COMMA callout_arg(COMMA callout_arg)*)? RP;

method_name: ID;

location: ID | ID LBRACKET expr RBRACKET;

expr: location
	| method_call
	| literal
	| expr bin_op expr
	| MINUS expr
	| EXCLAMATION expr
	| LP expr RP
	;

callout_arg: expr | string_literal;

bin_op: arith_op | rel_op | eq_op | cond_op;

arith_op: PLUS | MINUS | MULT | DIV | MOD;

rel_op: MENORQ | MAIORQ | MENORIGUAL | MAIORIGUAL;

eq_op: IG | DIFERENTE;

cond_op: E | OU;

literal: int_literal | char_literal | bool_literal;

alpha_num: alpha | digit;

alpha: LET;

digit: NUM;

hex_digit: digit | LET+;

int_literal: decimal_literal | hex_literal;

decimal_literal: NUM;

hex_literal: HEXLITERAL;

bool_literal: BOOLEANLITERAL;

char_literal: CHAR;

string_literal: STRING;







