(*Global : totalhours*)
(*Start, Pause and Reset can be accessed only from within the function*)
ClearAll[timer];
timer := DynamicModule[{start = AbsoluteTime[], total = 0, f = 0},
   Row[{
     Button["Start", If[f == 0, start = AbsoluteTime[]; f = 1], 
      Background -> Green, BaseStyle -> {"GenericButton", 16, Bold}, 
      FrameMargins -> 5, ImageSize -> {100, 80}],
     "  ",
     Button["Pause", 
      If[f == 1, f = 0; total = total + AbsoluteTime[] - start], 
      Background -> Yellow, BaseStyle -> {"GenericButton", 16, Bold}, 
      FrameMargins -> 5, ImageSize -> {100, 80}],
     "  ",
     Button["Reset", f = 0; total = 0, Background -> Red, 
      BaseStyle -> {"GenericButton", 16, Bold}, FrameMargins -> 5, 
      ImageSize -> {100, 80}],
     "     ",
     Framed@Text@Style[
        Dynamic[Clock[{1, 1, 1}, 1]; 
         totalhours = 
          If[f == 1, Floor[total + AbsoluteTime[] - start], 
           Floor[total]]]
        , Bold, FontSize -> 55]
     }]];
