(*
  Davey Anguiano
  CS 210
  March 18, 2020
  Homework #3
 *)

(* This function is for the round counter *)
(* fun newCounter() =
  let
    val counter = ref 1
    fun tick() = (counter := !counter + 1; !counter)
  in
    {tick = tick}
  end;

val gT = newCounter();
fun iterCount() =
  print("");
  #tick gT(); *)

val Hand = [	
  (* cost, spellp, name, attack, health *)     
  (1, false, "C slug", 0, 1),
  (1, false, "int", 1, 1),
  (1, true, "++", 0, 1),
  (1, true, "^=", 4, 0),
  (2, false, "for (;;)", 2, 2),
  (3, false, "switch", 3, 3),
  (4, false, "array a[100]", 4, 4),
  (4, true, "Bus Error Fireball", 6, 0)
];

fun getName(lst: (int * bool * string * int * int) list, cardChose : int) =
  case lst of x::xs => #cardChose x
  | [] => "The list is empty"

fun playerChooseCard(hand:(int * bool * string * int * int) list) =
  let
    val inputCardNum = valOf(TextIO.inputLine TextIO.stdIn)
    val cardChose : int = valOf(Int.fromString inputCardNum)
  in
    print("The card you chose: " ^ getName(Hand, cardChose) ^ "\n")
  end

fun gameLoop() =
  print("");

  while (true) do
    let
      val gCmd = valOf(TextIO.inputLine TextIO.stdIn)
    in
      if gCmd = "quit\n" then OS.Process.exit(OS.Process.success)
      (* This else if is used for testing purposes *)
      else if gCmd = "go\n" then playerChooseCard(Hand)
      else print("Invalid command: " ^ gCmd ^ "\n")
    end;
