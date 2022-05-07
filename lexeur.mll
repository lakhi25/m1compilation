{
    open Parseur
    exception Eof
    exception TokenInconu
}
rule token = parse
    [' ' '\t'] { token lexbuf }
    | ['\n'] { EOL }
    | ';' {PT_VIRG}
    | "True"   { BOOLEEN(true) }
    | "False"   { BOOLEEN(false) }
    | ['0'-'9' ]+(['.'] ['0'-'9'])? as lexem { NOMBRE (float_of_string lexem)}
    (*| ['0'-'9']+ as lexem { NOMBRE(int_of_string lexem) }*)
    | '+' { PLUS }
    | '-' { MOINS }
    | '*' { FOIS }
    | '%' { MODULO }
    | "==" { EQUAL }
    | "<=" { LOEQNB }
    | "!=" { NOTEQL }
    | '!'  { NOT }
    | "<" { LOSTNB }
    | ">" { GRSTNB }
    | ">=" { GREQNB }
    | "&&" { ET }
    | "||" { OU }
    | '(' { GPAREN }
    | ')' { DPAREN }
    | eof { raise Eof }
    | _ { raise TokenInconu }
