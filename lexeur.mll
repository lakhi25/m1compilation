{
    open Parseur
    exception Eof
    exception TokenInconu


}
rule token = parse
    [' ' '\t'] { token lexbuf }
    (*Les commentaires pas pris en compte par le parseur 
    c pour commentaire on a utilisé cette fichier pcq si on rentre dans le terminale comme on appuye sur entré ca nous affiche une erreur *)
    | "//"[^'\n']* { token lexbuf }  
    (* |'/''*'[^'*'|'\r''\n']'*''/'   { token lexbuf }  *)
    |'/''*'[^'*']*"*/"'\n' { token lexbuf }
    | ['\n'] { EOL } 
    | ';' {PT_VIRG}
    (* |['a'-'z' 'A'-'Z'] (['a'-'z' 'A'-'Z'] | ['0'-'9'] | "_")*  as lexem { IDENT(lexem) }  *)
    | ['0'-'9' ]+(['.'] ['0'-'9'])? + (['e''E']['-''+']?['0'-'9']+)? as lexem { NOMBRE (float_of_string lexem)}
    | "True"   { BOOLEEN(true) }
    | "False"   { BOOLEEN(false) }
    | ['0'-'9' ]+(['.'] ['0'-'9'])? as lexem { NOMBRE (float_of_string lexem)}
    (*| ['0'-'9']+ as lexem { NOMBRE(int_of_string lexem) }*)
    | '+'    { PLUS }
    | '-'    { MOINS }
    | '*'    { FOIS }
    | '%'    { MODULO }
    | "Nan"  as lexem { NOMBRE (float_of_string lexem)}
    | "=="   { EQUAL }
    | "<="   { LOEQNB }
    | "!="   { NOTEQL }
    | '!'    { NOT }
    | "<"    { LOSTNB }
    | ">"    { GRSTNB }
    | ">="   { GREQNB }
    | "&&"   { ET }
    | "||"   { OU }
    (* | "If"   { IF }
    | "Else" { ELSE }
    | "Loop" { LOOP }
    | "While"{ WHILE }
    | "For" { FOR}
    | "Do"   { Do }
    | "Funct" { FUNCT } *)
    (* | "="    { ASSIGN } *)
    | '('    { GPAREN }
    | ')'    { DPAREN }
    | eof    { raise Eof }
    | _      { raise TokenInconu }
