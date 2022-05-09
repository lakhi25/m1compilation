
type expression_a =
| Plus  of expression_a * expression_a
| Moins of expression_a * expression_a
| Mult  of expression_a * expression_a
| Modulo of expression_a * expression_a
| Ou of expression_a * expression_a
| Et of expression_a * expression_a
| Equals of expression_a * expression_a
| Greqnb of expression_a * expression_a
| Grstnb of expression_a * expression_a
| Loeqnb of expression_a * expression_a
| Lostnb of expression_a * expression_a
| Noteql of expression_a * expression_a
| Not    of expression_a 
| Neg   of expression_a
| Num   of float
| Bool  of bool

;;


(* Fonctions d'affichage *)

let rec print_binaire form s g d = Format.fprintf form "@[<2>%s%s@ %a%s@ %a%s@]" s "(" print_AST g " ," print_AST d " )" 

and print_AST form = let open Format in function
| Plus    (g,d) -> print_binaire form "Plus" g d
| Moins   (g,d) -> print_binaire form "Moins" g d
| Mult    (g,d) -> print_binaire form "Mult" g d
| Modulo  (g,d) -> print_binaire form "Modulo" g d
| Ou      (g,d) -> print_binaire form "Ou" g d
| Et      (g,d) -> print_binaire form "Et" g d
| Equals  (g,d) -> print_binaire form "Equals" g d
| Greqnb  (g,d) -> print_binaire form "Greqnb" g d
| Grstnb  (g,d) -> print_binaire form "Grstnb" g d
| Loeqnb  (g,d) -> print_binaire form "Loeqnb" g d
| Lostnb  (g,d) -> print_binaire form "Lostnb" g d
| Noteql  (g,d) -> print_binaire form "Noteql" g d
| Not    o    -> fprintf form "@[<2>%s@ %a@]" "Not" print_AST o
| Neg    e    -> fprintf form "@[<2>%s@ %a@]" "Neg" print_AST e 
| Num    n    -> fprintf form "@[<2>%s@ %f@]" "Num" n
| Bool   b     -> fprintf form "@[<2>%s@ %b@]"  "Bool" b

;; 

let rec code expression_a = match expression_a with
   | Plus   (g,d)->Printf.sprintf "%s\n%!" "AddiNb"
   | Moins  (g,d)->Printf.sprintf "%s\n%!" "SubiNb"