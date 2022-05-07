
%token <int> NOMBRE
%token PLUS MOINS FOIS MODU GPAREN DPAREN PT_VIRG EOL

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
    | expression MODU expression { $1 mod $3 }
    
    | GPAREN expression DPAREN { $2 }
    | MOINS expression %prec UMOINS { -$2 }
    | NOMBRE { $1 }
;
















