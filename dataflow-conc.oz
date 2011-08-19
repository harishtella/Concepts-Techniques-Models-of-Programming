% from page 251

declare
fun {Map Xs F}
   case Xs of nil then nil
   [] X|Xr then {F X}|{Map Xr F} end
end

declare F Xs Ys Zs
{Browse thread {Map Xs F} end }


fun {F X} X * X end
Xs = 1|2|Ys

