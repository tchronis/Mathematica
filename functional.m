ClearAll[all, x, y, z, f, g, h, a, b, c];

(*Function to remove hold and turn to string an expression*)
ClearAll[toString];
toString[hold_] :=
 (
  (*Command String*)
  StringReplace[(*To remove empty spaces*)
   StringTake[(*To remove the Hold Head*)
    ToString[
     hold
     ], {6, -2}]
   , " " -> ""]
  )


all = {
   {x, f, , Hold@(x // f)},
   {x, f, , Hold@(Nest[f, x, 3])},
   {x, f, , Hold@(Fold[#2[#1] &, x, {f, f, f}] )},
   {x, f, , Hold@((Composition @@ {f, f, f})[x])},
   {x, f, , Hold@(NestList[f, x, 3])},
   {x, f, , Hold@(FoldList[#2[#1] &, x, {f, f, f}] )},
   {x, f, , Hold@(ComposeList[{f, f, f}, x])},
   {x, f, , Hold@(x + Fold[f[#1 + #2] &, 0, {x, x, x}])},
   {x, f, , Hold@(Nest[a + f[#] &, x, 3] /. a -> x)},
   {x, f, a, Hold@(f @@ {x, a})},
   {x, f, a, Hold@(Nest[f[#1, x] &, a, 3])},
   {x, f, a, Hold@(Fold[f, a, {x, x, x}])},
   {x, f, a, Hold@(Nest[f[#, a] &, x, 3])},
   {x, f, a, Hold@(Fold[f, x, {a, a, a}])},
   {x, f, a, Hold@(NestList[f[#, a] &, x, 3] )},
   {x, f, a, Hold@(FoldList[f, x, {a, a, a}])},
   {x, f, {a, b, c}, Hold@(Fold[f, x, {a, b, c}] )},
   {x, f, {a, b, c}, Hold@(Fold[f[#1, #2] &, x, {a, b, c}])},
   {x, f, {a, b, c}, Hold@(Fold[f[#2, #1] &, x, {a, b, c}])},
   {x, f, {a, b, c}, Hold@(Flatten@Outer[f, {x}, {a, b, c}])},
   {x, f, {a, b, c}, Hold@(Thread[f[x, {a, b, c}]])},
   {x, f, {a, b, c}, Hold@(ListConvolve[{x}, {a, b, c}, 1, 0, f])},
   {x, {f, g, h}, , Hold@(#[x] & /@ {f, g, h})},
   {x, {f, g, h}, , Hold@(# @@ {x} & /@ {f, g, h})},
   {x, {f, g, h}, , Hold@(Through[{f, g, h}[x]])},
   {x, {f, g, h}, , Hold@(Through[{f, g, h} @@ {x}])},
   {x, {f, g, h}, , Hold@(Fold[#2[#1] &, x, Reverse@{f, g, h}])},
   {x, {f, g, h}, , Hold@(Compose[##, x] & @@ {f, g, h})},
   {x, {f, g, h}, , Hold@((Composition @@ {f, g, h})[x])},
   {x, {f, g, h}, , Hold@(ComposeList @@ {{f, g, h}, x})},
   {x, {f, g, h}, , Hold@(ComposeList[{f, g, h}, x])},
   {x, {f, g, h}, a, Hold@(Through[{f, g, h} @@ {x, a}])},
   {x, {f, g, h}, {a, b, c}, 
    Hold@(MapThread[#1[#2, #3] &, {{f, g, h}, {x, x, x}, {a, b, c}}])},
   {x, {f, g, h}, {a, b, c}, Hold@(x~f~a~g~b~h~c)},
   {x, {f, g, h}, {a, b, c}, 
    Hold@(ToExpression@ToString@Row[{x, f, a, g, b, h, c}, "~"])},
   {x, {f, g, h}, {a, b, c}, 
    Hold@(ToExpression@
         ToString@Row[{x, f, a, g, b, h, c}[[#]], "~"] & /@ 
       Table[Range[i], {i, 1, 7, 2}])},
   {{x, y, z}, , , Hold@(Plus @@ {x, y, z})},
   {{x, y, z}, , , Hold@(Fold[#1 + #2 &, 0, {x, y, z}])},
   {{x, y, z}, , , Hold@(Total@{x, y, z})},
   {{x, y, z}, , , Hold@(Fold[#1*#2 &, 1, {x, y, z}])},
   {{x, y, z}, , , Hold@(Times @@ {x, y, z})},
   {{x, y, z}, , , Hold@(Tuples[{x, y, z}, 2])},
   {{x, y, z}, , a, Hold@(Fold[{#2, #1} &, a, Reverse@{x, y, z}])},
   {{x, y, z}, , {a, b, c}, Hold@(Thread[{a, b, c} == {x, y, z}])},
   {{x, y, z}, f, , Hold@(f @@ {x, y, z})},
   {{x, y, z}, f, , Hold@(f /@ {x, y, z})},
   {{x, y, z}, f, , Hold@(Thread[f@{x, y, z}])},
   {{x, y, z}, f, , Hold@(Nest[f, f @@ {x, y, z}, 2])},
   {{x, y, z}, f, , Hold@(Fold[#2[#1] &, f @@ {x, y, z}, {f, f}])},
   {{x, y, z}, f, , Hold@(Apply[f, Tuples[{x, y, z}, 2], {1}])},
   {{x, y, z}, f, , Hold@(Tuples[f @@ {x, y, z}, 2])},
   {{x, y, z}, f, , Hold@(Apply[f, Subsets[{x, y, z}, {2}], {1}])},
   {{x, y, z}, f, , Hold@(Subsets[f @@ {x, y, z}, {2}])},
   {{x, y, z}, f, a, Hold@(Fold[f[#2, #1] &, a, Reverse@{x, y, z}])},
   {{x, y, z}, f, a, Hold@(Fold[f[#1, #2] &, a, {x, y, z}])},
   {{x, y, z}, f, a, Hold@(f @@@ Thread[{{x, y, z}, {a, a, a}}])},
   {{x, y, z}, f, a, Hold@(ListConvolve[{x, y, z}, {a}, 1, a, f])},
   {{x, y, z}, {f, g, h}, , Hold@(# @@ {x, y, z} & /@ {f, g, h})},
   {{x, y, z}, {f, g, h}, , Hold@(Through[{f, g, h} @@ {x, y, z}])},
   {{x, y, z}, {f, g, h}, , 
    Hold@(Through[(Plus @@ {f, g, h})[x, y, z]])},
   {{x, y, z}, {f, g, h}, , 
    Hold@((Composition @@ {f, g, h})[{x, y, z} /. List -> Sequence])},
   {{x, y, z}, {f, g, h}, , 
    Hold@((Composition @@ {f, g, h})[Sequence @@ {x, y, z}])},
   {{x, y, z}, {f, g, h}, , 
    Hold@(MapThread[#1@#2 &, {{f, g, h}, {x, y, z}}])},
   {{x, y, z}, {f, g, h}, , 
    Hold@(Inner[#1[#2] &, {f, g, h}, {x, y, z}, List])},
   {{x, y, z}, {f, g, h}, , 
    Hold@(Diagonal[
       Through /@ Distribute[{f, g, h}[{x, y, z}], List]])},
   {{x, y, z}, {f, g, h}, , 
    Hold@(MapThread[Compose, {{f, g, h}, {x, y, z}}])},
   {{x, y, z}, {f, g, h}, , 
    Hold@(Compose @@@ Thread@{{f, g, h}, {x, y, z}})},
   {{x, y, z}, {f, g, h}, , 
    Hold@(#[[1]][#[[2]]] & /@ Transpose[{{f, g, h}, {x, y, z}}])},
   {{x, y, z}, {f, g, h}, , 
    Hold@(Fold[#2[#1] &, {x, y, z}, Reverse@{f, g, h}] /. 
       List -> Sequence)},
   {{x, y, z}, {f, g, h}, , 
    Hold@(Outer[#1[#2] &, {f, g, h}, {x, y, z}])},
   {{x, y, z}, {f, g, h}, , 
    Hold@(Outer[MapAll, {f, g, h}, {x, y, z}])},
   {{x, y, z}, {f, g, h}, a, 
    Hold@(MapThread[#1 @@ {#2, a} &, {{f, g, h}, {x, y, z}}])},
   {{x, y, z}, f, {a, b, c}, 
    Hold@(MapThread[f, {{a, b, c}, {x, y, z}}])},
   {{x, y, z}, f, {a, b, c}, Hold@(Thread[f[{a, b, c}, {x, y, z}]])},
   {{x, y, z}, f, {a, b, c}, 
    Hold@(f @@@ Thread[{{a, b, c}, {x, y, z}}])},
   (*{{x,y,z},f,{a,b,c},Hold@(SetAttributes[f, Listable];f[{a,b,c},{x,
   y,z}])},*)
   {{x, y, z}, f, {a, b, c}, 
    Hold@(Inner[f, {a, b, c}, {x, y, z}, List])},
   {{x, y, z}, f, {a, b, c}, 
    Hold@(Inner[f, {a, b, c}, {x, y, z}, Plus])},
   {{x, y, z}, f, {a, b, c}, 
    Hold@(Inner[f, {a, b, c}, {x, y, z}, Times])},
   {{x, y, z}, f, {a, b, c}, 
    Hold@(Apply[f, Tuples[{{x, y, z}, {a, b, c}}], {1}])},
   {{x, y, z}, f, {a, b, c}, 
    Hold@(Attributes[f] = {}; 
      Distribute[f[{a, b, c}, {x, y, z}], List])},
   {{x, y, z}, f, {a, b, c}, 
    Hold@Apply[f, Distribute[{{a, b, c}, {x, y, z}}, List], 1]},
   {{x, y, z}, f, {a, b, c}, 
    Hold@Apply[f, Tuples[{{a, b, c}, {x, y, z}}], {1}]},
   {{x, y, z}, f, {a, b, c}, Hold@Outer[f, {a, b, c}, {x, y, z}]},
   {{x, y, z}, f, {a, b, c}, 
    Hold@(Transpose@Outer[f, {a, b, c}, {x, y, z}])},
   {{x, y, z}, f, {a, b, c}, 
    Hold@Map[
      Function[p2, Map[Function[p1, f[p1, p2]], {a, b, c}]], {x, y, 
       z}]},
   {{x, y, z}, f, {a, b, c}, Hold@Map[f, {{x, y, z}, {a, b, c}}, {2}]},
   {{x, y, z}, f, {a, b, c}, 
    Hold@Transpose@Map[f, {{x, y, z}, {a, b, c}}, {2}]},
   {{x, y, z}, f, {a, b, c}, 
    Hold@((f @@ {x, y, z}) /. Thread[{x, y, z} -> {a, b, c}])},
   {{x, y, z}, {f, g}, {a, b, c}, 
    Hold@(Inner[f, {a, b, c}, {x, y, z}, g])},
   {{x, y, z}, {f, g, h}, {a, b, c}, 
    Hold@(MapThread[#1 @@ {#2, #3} &, {{f, g, h}, {x, y, z}, {a, b, 
         c}}] )},
   {{x, y, z}, {f, g, h}, {a, b, c}, 
    Hold@(Through[Through[{f, g, h} @@ {x, y, z}] @@ {a, b, c}])}
   };
   
   (*-----------------------------------------------------------------*)
   
   Manipulate[Module[{list},
  list = Select[
    Reverse@({
          ToString@all[[#, 1]],
          ToString@all[[#, 2]],
          ToString@all[[#, 3]],
          Evaluate@Release@all[[#, 4]],
          Depth@(Evaluate@Release@all[[#, 4]]),
          toString[all[[#, 4]]],
          toString@FullForm[all[[#, 4]]],
          Depth@all[[#, 4]] - 1
          } & /@ Range[Length[all]]
       ) /. "Null" -> ""
    ,
    MemberQ[
      Flatten[Outer[List, inputa, inputb, inputc], 2]
      , #[[1 ;; 3]]
      ] &];(*Select*)
  
  Column[{
    {inputa, inputb, inputc}, Length[list],
    Grid[
     Join[{{"Input A", "Input B", "Input C", "Result", "Res-D", "How",
         "FullForm", "How-D"}},
      list
      ](*Join*)
     , Frame -> All, Alignment -> Left](*Grid*)
    }](*Column*)
  ](*Module*)
 , {{inputa, {"", "x"}, "Input A"}, {"" -> "None", 
   "x" -> "one variable    ", "{x, y, z}" -> "list of variables"}, 
  ControlType -> CheckboxBar}
 , {{inputb, {"", "f"}, "Input B"}, {"" -> "None", 
   "f" -> "one function  ", "{f, g}" -> "two functions", 
   "{f, g, h}" -> "list of functions"}, ControlType -> CheckboxBar}
 , {{inputc, {""}, "Input C"}, {"" -> "None", "a" -> "one parameter", 
   "{a, b, c}" -> "list of parameters"}, ControlType -> CheckboxBar}
 , SaveDefinitions -> True
 ]
