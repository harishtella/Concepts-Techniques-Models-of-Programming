% 3
fun {Length Ls}
   case Ls
   of nil then 0
   [] _|Lr then 1+{Length Lr}
   end
end

{Browse {Length [1 2 3]}}

declare
fun {Length2 Ls}
   fun {Len Li C}
      case Li
      of nil then C
      [] H|T then {Len T C+1}
      end
   end
in
   {Len Ls 0}
end

{Browse {Length2 [1 2 3]}}

% 4
declare
fun {Member Xs Y}
   case Xs
   of nil then false
   [] H|T then (if H==Y then true else {Member T Y} end)
   end
end

{Browse {Member [1 2 3 4] 3}}
{Browse {Member [1 2 3 4] 9}}


% 9
declare
fun {Head Xs} X Xr in Xs=X|Xr X end
declare
fun {Tail Xs} X Xr in Xs=X|Xr Xr end
   
declare
Xs {Browse Xs} Ys={Tail Xs} Zs={Tail Ys} a={Head Zs}

% 10
declare M
M=cons(head: 1 tail: cons(head: 2 tail: e1))

{Browse M}

declare
fun {Length Xs}
   case Xs
   of e1 then 0
   [] cons(head: H tail: T) then 1+{Length T}
   end
end

{Browse {Length M}}