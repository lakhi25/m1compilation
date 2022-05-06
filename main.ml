(*fichier main.ml *)

(* the arguments that are passed to a given program on the command line are stored in an array. Following tradition, this array is named argv. 
It is found in the Sys module of the standard library, therefore its full name is Sys.argv. *)
let _ = 
  try
      let lexbuf = Lexing.from_channel stdin in (*lexeur lancé sur stdin*)
      while true do (*on ne s'arrête pas*)
          Parseur.main Lexeur.token lexbuf (*parseur une ligne*)
      done
  with
      | Lexeur.Eof -> exit 0 (*impossible*)
      | Lexeur.TokenInconu (*erreur de lexing*)
      | Parsing.Parse_error -> (*erreur de parsing*)
          Printf.printf ("Ceci n'est pas une expression arithmetique\n")

  


      
