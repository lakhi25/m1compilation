%{
  open AST
%}
/*float in js pour toutes les nombres int et meme flottante  */
%token <float> NOMBRE
%token <bool> BOOLEEN
%token PLUS MOINS FOIS MODULO GPAREN DPAREN  OU ET NOT EQUAL NOTEQL GRSTNB GREQNB LOSTNB LOEQNB EOL PT_VIRG


%left OU
%left ET
%nonassoc NOT
%nonassoc EQUAL NOTEQL 
%nonassoc GRSTNB GREQNB LOSTNB LOEQNB
%left PLUS MOINS
%left FOIS MODULO
%nonassoc UMOINS
/**non terminaux*/
%type <AST.expression_a> main expression
%start main
%%
main:
    expression PT_VIRG EOL {$1}
;
expression:
      expression PLUS expression {Plus ($1,$3)}
    | expression MOINS expression {Moins($1,$3)}
    | expression FOIS expression {Mult($1,$3)}
    | expression MODULO expression {Modulo($1,$3)}

    | expression OU expression {Ou($1,$3)}
    | expression ET expression {Et($1,$3)}


    | expression EQUAL expression {Equals($1,$3)}
    | expression GRSTNB  expression {Grstnb($1,$3)}
    | expression GREQNB expression {Greqnb($1,$3)}
    | expression LOEQNB expression {Loeqnb($1,$3)}
    | expression LOSTNB expression {Lostnb($1,$3)}
    | expression NOTEQL expression {Noteql($1,$3)}
    | NOT expression { Not $2}


    | GPAREN expression DPAREN {$2}
    | MOINS expression %prec UMOINS {Neg $2}
    | NOMBRE {Num $1}
    | BOOLEEN { Bool $1 }

;