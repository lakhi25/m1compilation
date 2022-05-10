   
    let _ = 
        try
            let argc = Array.length Sys.argv in 
            let lexbuf = if (argc == 2) then let file = open_in Sys.argv.(1) in Lexing.from_channel file
                         else Lexing.from_channel stdin in (*lexeur lancé sur stdin*)
            while true do (*on ne s'arrête pas*)
                let file1 = open_out ("~/Documents/M1INFO/testcompil/compil/h.txt")in  
                close_out file1;
                Parseur.main Lexeur.token lexbuf (*parseur une ligne*)

                |> Format.printf "%a\n%!" AST.print_AST ;
            done
        with
            | End_of_file -> close_in(open_in Sys.argv.(1))
            | Lexeur.Eof -> exit 0 (*impossible*)
            | Lexeur.TokenInconu (*erreur de lexing*)
            | Parsing.Parse_error -> (*erreur de parsing*)
                Printf.printf ("Ceci n'est pas une expression arithmetique\n")
            
let argc = Array.length Sys.argv in 
        let main = if (argc == 2 )then (open_in Sys.argv(1))
                   else 
                    (* open_out va ouvrir le fichier  *)
        let main1 = if(argc == 2) then (open_out(Sys.argv(1)^".jsm"))
                else 
        