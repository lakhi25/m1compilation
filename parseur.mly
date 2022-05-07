%{
  open AST
%}
/*float in js pour toutes les nombres int et meme flottante  */
%token <int> NOMBRE
%token PLUS MOINS FOIS MODULO GPAREN DPAREN PT_VIRG EOL

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
    /*| expression MODULO expression {Modulo($1,$3)}*/
    | GPAREN expression DPAREN {$2}
    | MOINS expression %prec UMOINS {Neg $2}
    | NOMBRE {Num $1}
;