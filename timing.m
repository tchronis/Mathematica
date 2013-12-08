(*http://mathematica.stackexchange.com/questions/22419/benchmarking-expressions*)
(*http://stackoverflow.com/questions/4198961/what-is-in-your-mathematica-tool-bag/4199042#4199042*)

SetAttributes[timeAvg, HoldFirst]

timeAvg[func_] := Do[If[# > 0.3, Return[#/5^i]] & @@ Timing@Do[func, {5^i}], {i, 0, 15}]
