%token <int> NOMBRE
%token  PLUS MOINS FOIS GPAREN DPAREN EOL

%left PLUS MOINS
%left FOIS
%nonassoc UMOINS
/**non terminaux aussi vont creer des tokens contenant des entiers*/
%type <int> main expression
%start main
%%
/* $1...Les actions, ici,sont de type entier
, c’est l’entier que l’on va mettre dans le token créé.*/
main:

    expression EOL { $1 }
;
expression:
      expression PLUS expression { $1+$3 }
    | expression MOINS expression { $1-$3 }
    | expression FOIS expression { $1*$3 }
    | GPAREN expression DPAREN { $2 }
    | MOINS expression %prec UMOINS { -$2 }
    | NOMBRE { $1 }
;






















