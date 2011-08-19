% 17. Hamming Problem

declare
fun {HammingNumbers k}
   Hams = 1|{Reduce Merge {GenMultLists K Hams}}
end

declare
fun lazy {Merge Xs Ys}
   case Xs#Ys
   [] X:Xr#Y:Yr if X < Y then
		   X|{Merge Xr Ys}
		elseif Y < X then
		   Y|{Merge Xs Yr}
		else
		   X|{Merge Xr Yr}
		end
   end
end

declare
fun {GenMultLists K Hams}
   if K > 0
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

