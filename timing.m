(*http://mathematica.stackexchange.com/a/32030/7966 *)
(*This will print the total evaluation time for each cell as it completes in the lower left window margin:*)

SetOptions[$FrontEndSession, EvaluationCompletionAction -> "ShowTiming"]


(*http://mathematica.stackexchange.com/a/22427/7966 *)
(*This performs enough repetitions of a given operation to exceed the threshold (0.3 seconds) with the aim getting a sufficiently stable and precise timing.*)

SetAttributes[timeAvg, HoldFirst];
timeAvg[func_] := Do[If[# > 0.3, Return[#/5^i]] & @@ Timing@Do[func, {5^i}], {i, 0, 15}]


(*http://mathematica.stackexchange.com/a/7769/7966 *)
(*You can put your Mathematica session in debug mode by going to Evaluation->Debugger
Then, make some definitions and wrap the profiled code in RuntimeTools`Profile *)

(*Example:
f[x_] := x^2;
Table[f[x], {100000}]; // RuntimeTools`Profile
*)
