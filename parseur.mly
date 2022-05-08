
%token <int> NOMBRE
%token <bool> BOOLEEN
%token PLUS MOINS FOIS MODULO GPAREN DPAREN  OU ET NOT EQUAL NOTEQL GRSTNB GREQNB LOSTNB LOEQNB EOL PT_VIRG


%left OU
%left ET
%nonassoc NOT
%nonassoc EQUAL NOTEQL 
%nonassoc GRSTNB GREQNB LOSTNB LOEQNB
%left PLUS MOINS
%left FOIS MODU
%nonassoc UMOINS
/**non terminaux*/
%type <int> main expression
%start main
%%
main:
    expression PT_VIRG  { $1 }
;
expression:
      expression PLUS expression { $1+$3 }
    | expression MOINS expression { $1-$3 }
    | expression FOIS expression { $1*$3 }
    | expression MODULO expression { $1 mod $3 }
    // | "True"   { BOOLEEN(true) }
    // | "False"   { BOOLEEN(false) }

    // | expression OU expression { $1||$3 }
    // | expression ET expression { $1&&$3 }


    // | expression EQUAL expression { $1==$3 }
    // | expression GRSTNB  expression { $1>$3 }
    // | expression GREQNB expression { $1>=$3 }
    // | expression LOEQNB expression { $1<=$3 }
    // | expression LOSTNB expression { $1<$3 }
    // | expression NOTEQL expression { $1!=$3 }
    // | NOT expression { Not $2}   

    | GPAREN expression DPAREN { $2 }
    | MOINS expression %prec UMOINS { -$2 }
    | NOMBRE { $1 }
;
















