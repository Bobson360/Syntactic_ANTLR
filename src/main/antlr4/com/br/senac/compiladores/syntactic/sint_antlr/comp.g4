grammar comp;


program	:  'program' STR bloco ;

bloco	: (begin)+
		;
 
decl    :  (declaravar)+
        ;

declaravar	: VAR  ID  (  VIR ID )* CL type SC
			;

type      	: INT	 
			| REAL	
           	;
		 
cmd 	: declaravar 
		| cmdleitura 
		| cmdescrita 
		| cmdattrib  
		| cmd_condition 
		| cmd_repetition 
		| ID
		;
		
begin	: (declaravar)*
		BEGIN 
		(cmd)+ 
		END 
		;	

cmdleitura	: READ		AP 
						fatAri 
						FP 
						SC
			;
			

cmdescrita	:			WRITE AP 
						fatAri 
						FP 
						SC
			;
cmdattrib 	: ID ATTR expressAri SC
			;

term 		: ID REAL 
			; 

expressAri
	:	expressAri OP_ARIT1 termoAritmetico
	|	termoAritmetico
	;
	
termoAritmetico
	:	termoAritmetico OP_ARIT2 fatAri
	|	fatAri
	;

expressRel
	:	expressRel OP_BOOL termoRel
	|	termoRel
	;
	
termoRel
	:	expressAri OP_REL expressAri
	|	'(' expressRel ')'
	;

cmd_condition  :  
			IF expressRel 'then' (cmd)+ |
			IF expressRel 'then' 
				(cmd+)
              ELSE 
              	(cmd+) 
              
			;

cmd_repetition	:	
			WHILE expressRel
			DO	(cmd)+ 
			;

STR  : '"'[a-zA-Z0-9\t ]*'"'
	 ;
	 			
AP	: '('
	;
	
FP	: ')'
	;
	
SC	: ';'
	;

CL	: ':'
	;

OP	: '+' | '-' | '*' | '/'
	;
	
ATTR : ':='
	 ;
	 
VIR  : ','
     ;
     
ACH  : '{'
     ;
     
FCH	 : '}'
     ;
  
DOT	 : '.'
	 ;
	 
	 
//KEYWORDS
VAR		:	'var'		;
IF		:	'if'		;
ELSE	:	'else'		;
BEGIN	:	'begin'		;
END		:	'end'		;
READ	:	'read'		;
WRITE	:	'write'		;
INT		:	'int'		;
FLOAT	:	'float'		;
BOOL	:	'boolean'	;
WHILE	: 	'while'		;
DO		:	'do'		;

OP_BOOL : 'or' | 'and'  ;

COMENTARY
	:	'//' ~('\n'|'\r')* '\r'? '\n' {skip();}
	;

OP_ARIT1
	:	'+' | '-'
	;

OP_ARIT2
	:	'*' | '/'
	;

fatAri
	:	INTEGER
	|	REAL
	|	ID
	|	'(' expressAri ')'
	;

OP_REL : '>' | '<' | '>=' | '<=' | '=' | '<>'
      ;
      
ID	: [a-z] ([a-z] | [A-Z] | [0-9])*
	;
	
REAL	: [0-9]+ ('.' [0-9]+)?
		;

INTEGER	: [0-9]+
		;
		
WS	: (' ' | '\t' | '\n' | '\r') -> skip; 