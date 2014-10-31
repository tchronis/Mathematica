(*panelAddToListFromList (v0.2)*)

(*See DynamicModule Wormholes in the documentation *)
ClearAll[panelAddToListFromList];
SetAttributes[panelAddToListFromList, 
  HoldFirst];(*Call by Reference for "added"*)
panelAddToListFromList[added_, list_, init_: {}, debug_: False] := 
 DynamicModule[{a, x},
  added = init;
  Column[{
    Row[{
      Column[{
        ListPicker[Dynamic[x], Thread[Range[Length[list]] -> list]
         , ImageSize -> {200, 200}, 
         Background -> {{LightYellow, LightYellow}}, 
         Multiselection -> True]
        }]
      , "  ",
      Column[{
        Button["Add All", added = Range[Length@list]], "",
        Button["Add", added = Join[added, Complement[x, added]]],
        Button["Remove", If[a != {}, added = Complement[added, a]]; 
         If[added == {}, a = {}]], "",
        Button["Clear", added = {}; a = {}]
        }]
      , "  ",
      Dynamic@
       If[added == {}, a = {}; 
        ListPicker[1, {""}, ImageSize -> {200, 200}],
        ListPicker[Dynamic[a], Thread[added -> list[[added]]], 
         ImageSize -> {200, 200}, 
         Background -> {{LightGreen, LightGreen}}, 
         Multiselection -> True]
        ]
      , " ",
      Column[{
        Button["up",
         If[added != {},
          Module[{pos},
           
           pos = Position[added, a[[1]]][[1, 
             1]];(*Only for the first selected a*)
           
           If[pos > 1, 
            added[[{pos - 1, pos}]] = added[[{pos, pos - 1}]]]
           ]]
         ],
        Button["down",
         If[added != {},
          Module[{pos},
           
           pos = Position[added, a[[1]]][[1, 
             1]];(*Only for the first selected a*)
           
           If[pos < Length[added], 
            added[[{pos, pos + 1}]] = added[[{pos + 1, pos}]]]
           ]]
         ]
        }]
      , If[debug, Row[{Dynamic[x], Dynamic[a], Dynamic[added]}], ""]
      }]
    }]
  (*,InheritScope\[Rule]True*)(*wormhole*)];
  
(*Usage Example*)
(*
Framed@DynamicModule[{added = {}},
  Column@{
    Framed@panelAddToListFromList[added,
       {"adata 1", "adata 2", "bdata 3", "bdata 4", "cdata 5", 
        "cdata 6", "ddata 7"}
       , {}, True][[2]](*the [[
    2]] takes only the result and not the whole DynamicModule*),
    {Dynamic[added]}
    }]
  *)

(*---------------------------------------------------------------------------*)
  
(*panelSetOfInputFields (v0.1)*)
 
ClearAll[panelSetOfInputFields];
SetAttributes[panelSetOfInputFields, HoldFirst];
panelSetOfInputFields[x_, init_: {0}, description_: {""}] := 
 DynamicModule[{l},
   l = Length[init];
   x = init;
   Column@Flatten@Map[Row, Transpose@{
        If[description == {""}, Table["", {l}], description],
        Table[" ", {l}],
        Table[
         With[{i = i},
          
          InputField[Dynamic[x[[i]]], Number, FieldSize -> 4, 
           ContinuousAction -> True]
          ], {i, 1, l}],
        Table["  ", {l}]
        }]
   (*,InheritScope\[Rule]True*)(*wormhole*)][[
  2]];(*the [[2]] takes only the result and not the whole \
DynamicModule*)

(*Usage Example*)
(*
Framed@DynamicModule[{x},
  Column@{Framed@
     panelSetOfInputFields[
      x, {3.14, 5, 0, N[Pi, 4]}, {"value 1", "Value 2", "Value 3", 
       "Value 4"}]
    , Dynamic[x]}]
*)
