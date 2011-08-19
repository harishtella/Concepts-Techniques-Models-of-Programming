
declare
fun {Fact N}
   if N==0 then 1 else N*{Fact N-1} end
end


% EX 1.7
local X in
   X= {NewCell 23}
   X:=44
   {Browse @X}
end

	

% EX 1.8
declare
local Acc in
   Acc= {NewCell 0}
   fun {Accumulate X}
      Acc := @Acc+X
      @Acc
   end  
end

	     