% EX 3.1
declare
fun {Abs X} if X<0.0 then ~X else X end end

% EX 3.2
declare
fun {Cubedrt X}
   fun {Improve Guess}
      ((X/{Pow Guess 2.0}) + (2.0 * Guess)) / 3.0
   end
   fun {Improve2 Guess}
      (Guess + X/Guess) / 2.0
   end
   
   fun {GoodEnough Guess}
     {Abs X-Guess*Guess}/X < 0.00001
   end
   fun {CubertIter Guess}
      if {GoodEnough Guess} then Guess
      else
         {CubertIter {Improve Guess}}
      end
   end
   Guess=1.0
in
   {CubertIter Guess}
end


{Browse {Cubedrt 27.0}}

{Browse {Pow 10.0 2.0}}
