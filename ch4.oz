% 17. Hamming Problem


%--------Util FNs-------
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
fun {Reduce Xs F E}
   case Xs
   of nil then E
   [] X|Xr then {F X {Reduce Xr F E}}
   end
end

%-------------------

declare
fun lazy {GenMultiples N Hams}
   {LMap Hams fun {$ X} X*N end}
end

declare
fun {GenMultLists K Hams}
   if K > 1 then
      {GenMultiples K Hams}|{GenMultLists K-1 Hams}
   else
      nil
   end
end

declare
fun lazy {Merge Xs Ys}
   case Xs#Ys
   of (X|Xr)#(Y|Yr) then
      if X < Y then
	 X|{Merge Xr Ys}
      elseif Y < X then
	 Y|{Merge Xs Yr}
      else
	 X|{Merge Xr Yr}
      end
   [] X#nil then X
   [] nil#Y then Y
   end
end

declare
fun {HammingNumbers K}
   local Hams in
      Hams = 1|{Reduce {GenMultLists K Hams} Merge nil}
   end
end

declare Hams = {HammingNumbers 3}
{Browse Hams}
{Touch 20 Hams}