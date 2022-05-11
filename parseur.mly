%{
  open AST
%}
/*float in js pour toutes les nombres int et meme flottante  */
%token <float> NOMBRE
%token <bool> BOOLEEN
%token <string> IDENT
%token PLUS MOINS FOIS MODULO NAN  GPAREN DPAREN  ASSIGN OU LOOP ET NOT EQUAL NOTEQL GRSTNB GREQNB LOSTNB LOEQNB IF ELSE WHILE FOR DO FUNCT GACOLL DACOLL EOL PT_VIRG 


%left OU
%left ET
%nonassoc NOT  
%nonassoc EQUAL NOTEQL 
%nonassoc GRSTNB GREQNB LOSTNB LOEQNB
%left PLUS MOINS
%left FOIS MODULO
%left NAN
%nonassoc UMOINS

/**non terminaux*/
%type <AST.expression_a> main programme commande expression
%start main
%%

main:
    GACOLL programme DACOLL {$2} 

programme :
    GACOLL programme DACOLL {$2}
    | commande PT_VIRG EOL {$1}
    // | PT_VIRG

commande :
    expression PT_VIRG {$1}
    |  GACOLL programme DACOLL {$2}

// commande :   
//      expression PT_VIRG EOL {$1}
//     |;
//     | GACOLL programme DACOLL {$2}
    // | IF GPAREN expression DPAREN commande ELSE commande { If ($3,$5,$7)}
    // | DO commande WHILE GPAREN expression DPAREN {do($2) while($5)}//pas sur
    // | WHILE GPAREN expression DPAREN LOOP commande {while ($3) loop($6)}//pas sur
    // | FOR GPAREN expression PT_VIRG expression PT_VIRG expression DPAREN commande { For ($3,$5,$7,$9)}
    // | FUNCT IDENT GPARAN DPAREN GACOLL programme DACOLL { Funct($2,$6) }

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