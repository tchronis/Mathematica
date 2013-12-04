(*
Related info :
http://mathematica.stackexchange.com/questions/8595/simple-countdown-\
timer-in-mathematica
*)
ClearAll[countdown];
countdown::usage = 
  "Count down s seconds and when you reach 0 run expression f. s must \
be a positive integer 1,2,... and f must be a string. f's default \
value is \"0\" and coresponds to the evalution of Beep[] function.";
countdown[s_?(IntegerQ[#] && # > 0 &), f : (_?StringQ) : "0"] := 
 DynamicModule[{guard = True, result = ""},
  Dynamic[
   {
    If[guard && # === 0, 
       If[f == "0", Beep[], result = ToExpression[f]]; 
       guard = False; #, #] &[s - Clock[{0, s, 1}, s, 1]]
    , result}]
  ]
