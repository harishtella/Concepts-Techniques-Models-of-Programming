
% 1
declare 
fun {Fib N}
   case N
   of 0 then 0
   [] 1 then 1
   else
      thread {Fib N-1} end + thread {Fib N-2} end
   end
end

{Fib 100 10}