(*Usefull Palettes*)
(*Multiple notebooks in Mathematica*)
(*http://mathematica.stackexchange.com/questions/28226/multiple-notebooks-in-mathematica/28229?noredirect=1#comment88697_28229*)
(*Without Palette's Notebook*)
With[{title = "Notebook selector"}, 
 CreatePalette[
  Dynamic@Column[
    DeleteCases[
     Button["WindowTitle" /. NotebookInformation@#, 
        SetSelectedNotebook@#] & /@ Notebooks[], Button[title, _]]], 
  WindowTitle -> title]]
