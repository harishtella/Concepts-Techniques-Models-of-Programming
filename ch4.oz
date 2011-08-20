% 17. Hamming Problem

declare
fun {HammingNumbers K}
   local Hams in
      Hams = 1|{Reduce {GenMultLists K Hams} Merge}
   end
end

declare Hams = 1|{Reduce {GenMultLists 2 Hams} fun {$ X Y} {Merge X Y} end}
{Browse Hams}
{Touch 20 Hams}

declare Hams H2 MS
Hams = 1|H2
declare H3
H2 = 5|H3
MS = {GenMultLists 2 Hams}

{Browse Hams}
{Browse MS}

declare U
U = {Reduce MS Merge}
{Browse U}
{Touch 2 U}

declare
fun lazy {Merge Xs Ys}
   case Xs#Ys
   of (X|Xr)#(Y|Yr)
      if X < Y then
	 X|{Merge Xr Ys}
      elseif Y < X then
	 Y|{Merge Xs Yr}
      else
	 X|{Merge Xr Yr}
      end
   end
end

declare
fun lazy {Fives Xs}
   case Xs of X|Xr then (5 * X)|{Fives Xr} end
end

declare
fun lazy {Sixes Xs}
   case Xs of X|Xr then (6 * X)|{Sixes Xr} end
end

declare TM = 1|{Merge {Fives TM} {Sixes TM}}
{Browse TM}
{Touch 10 TM}

declare
fun {GenMultLists K Hams}
   if K > 0 then
      {GenMultiples K Hams}|{GenMultLists K-1 Hams}
   else
      nil
   end
end

%-------------------

declare
fun lazy {GenMultiples N Hams}
   {LMap Hams fun {$ X} X*N end}
end

%-------------------

declare
proc {Touch N Xs}
   if N > 0 then
      case Xs
      of nil then skip
      [] _|Xr then {Touch N-1 Xr}
      end
   end
end

declare
fun lazy {LMap Xs F}
   case Xs
   of nil then nil
   [] X|Xr then {F X}|{LMap Xr F}
   [] X then {F X}
   end
end

declare
fun {Reduce Xs F}
   case Xs
   of nil then nil
   [] (X|Xl)|(Xr|Xlr) then{F (X|Xl) {Reduce (Xr|Xrl) F}}
   [] X then X
   end
end

{Browse {Reduce [[1 2 3] [4 5 6] [7 8 9]] Append}}
{Browse {Append [1 2 3] nil}}

declare P Z
Z = 1|2|3|4
P = {Reduce Z fun {$ X Y} X + Y end}
{Browse P}