(* This version allows input but doesn't increament turn number *)

fun gameLoop() =
  print("Enter command: ");

  let
    val gT = ref 1
  in
    while (!gT >= 1) do
      let
        val gCmd = valOf(TextIO.inputLine TextIO.stdIn)
      in
        if gCmd = "quit\n" then OS.Process.exit(OS.Process.success)
        else if gCmd = "go\n" then print("Turn: " ^ (Int.toString(!gT)) ^ "\n")
        else print("Invalid command: " ^ gCmd ^ "\n")
      end 
  end;