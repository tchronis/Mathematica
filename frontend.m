(*Open two copies of the same notebook*)
(*http://mathematica.stackexchange.com/questions/9280/open-two-copies-of-the-same-notebook*)
(*
The code below creates a palette (which can be installed using the menu: Palettes/Install Palette) 
containing a single button to create a duplicate of the active notebook. 
The update button for the duplicate is located in the duplicate itself, leaving the original notebook unchanged. 
The duplicate is closed using the normal window close button, but it has "ClosingSaveDialog" set to False so you 
won't get a save prompt.
*)
CreatePalette[Button["Duplicate Active Notebook",
   NotebookPut[NotebookGet[InputNotebook[]] /. 
   {Rule[DockedCells, _] :> Sequence[], 
    Rule[WindowMargins, _] :> Rule[WindowMargins, {{0, Automatic}, {0, Automatic}}], 
    Cell[x___] :> Cell[x, Evaluatable -> False]}, 
    Background -> GrayLevel[0.95], Editable -> False, "ClosingSaveDialog" -> False, 
    DockedCells -> With[{sourcenb = InputNotebook[]}, 
      Cell[BoxData[ToBoxes[Button["Update", 
          SelectionMove[InputNotebook[], All, Notebook]; 
          NotebookWrite[InputNotebook[], 
           NotebookGet[sourcenb] /. Cell[x___] :> Cell[x, Evaluatable -> False]]]]],
       "DockedCell", CellContext -> Cell]],
    WindowTitle -> "Duplicate of " <> AbsoluteOptions[InputNotebook[], WindowTitle][[1, 2]]];
   SetSelectedNotebook[InputNotebook[]]], WindowTitle -> "Duplicate"];
