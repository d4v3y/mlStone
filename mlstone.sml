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

val AIHand = [
    (* cost, spellp, name, attack, health *)     
    (1, true, "Atom", 0, 1),
    (1, true, "Car", 1, 0),
    (1, true, "Cdr", 2, 0),
    (1, false, "Parenthesis", 1, 1),
    (2, false, "Cons Cell", 2, 1),
    (2, false, "defun", 3, 2),
    (3, true, "Mapcar", 4, 0),
    (4, false, "ML Monster", 2, 6)
];

fun getName(lst: (int * bool * string * int * int) list, cardChose : int) =

  if List.length(lst) >= cardChose - 1 
  then let 
        val cardFromList = List.nth(lst, cardChose - 1)
        val finalChoice = #3 cardFromList
      in
          finalChoice
      end
  else "";

fun aiChooseCard(aiHand:(int * bool * string * int * int) list) = (
  let
    val nextInt = Random.randRange(1, List.length(aiHand))
    val r = Random.rand(1,1)
    val cardNum = nextInt r
  in
    print("The AI sent out: " ^ getName(aiHand, cardNum) ^ "\n")
  end
);

fun playerChooseCard(hand:(int * bool * string * int * int) list) = (
  print("Enter the card number: ");

  let
    val inputCardNum = valOf(TextIO.inputLine TextIO.stdIn)
    val cardChose : int = valOf(Int.fromString inputCardNum)
  in
    print("You choose the card: " ^ getName(hand, cardChose) ^ "\n")
  end
);

fun combat() = 
  playerChooseCard(Hand);
  aiChooseCard(AIHand);

fun gameLoop() = (
  print("\n------------------ WELCOME TO MLSTONE ------------------\n");
  print("\t\tTo exit game type \"quit\"\n\n");
  print("Ready to play? (yes/no): ");

  while (true) do
    let
      val gCmd = valOf(TextIO.inputLine TextIO.stdIn)
    in
      if gCmd = "quit\n" then OS.Process.exit(OS.Process.success)
      else if gCmd = "no\n" then OS.Process.exit(OS.Process.success)
      else if gCmd = "yes\n" then combat()
      else print("Invalid command: " ^ gCmd ^ "\n")
    end
);
gameLoop();