(*fichier lexeur.mll *)
{
    open Parseur
    exception Eof
    exception TokenInconu
}
rule token = parse
    [' ' '\t' '\n'] { token lexbuf }
    | ';' { PT_VIRG }
    | ['0'-'9' ]+(['.'] ['0'-'9'])?  as lexem { NOMBRE(int_of_string lexem) }
    | '+' { PLUS }
    | '-' { MOINS }
    | '*' { FOIS }
    | '%' { MODU }
    | '(' { GPAREN }
    | ')' { DPAREN }
    | eof { raise Eof }
    | _ { raise TokenInconu }