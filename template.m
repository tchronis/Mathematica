(* Taken by Maeder's book "Computer Science with Mathematica" Listing 4.4-1 *) 

BeginPackage["Template`"]

Function1::usage = "Function1[n] does nothing."

Function2::usage = "Function2[n,(m:17)] does even less."

Begin["`Private`"]

Aux[f_] := Do[something]  (* an auxiliary function *)

Function1[n_] := n

Function2[n_, m_:17] /; n<5 :=n m

End[]

EndPackage[]
