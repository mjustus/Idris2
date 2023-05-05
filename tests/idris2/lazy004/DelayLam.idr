f1 : Lazy (Unit -> Unit)
f1 = \x => x

f2 : Lazy (Unit -> Unit)
f2 = Delay (\x => x)

failing "not a function type"
  f3 : Unit -> Lazy (Unit -> Unit)
  f3 x y = y

failing "not a function type"
  f4 : Lazy (Unit -> Unit)
  f4 x = x


f5 : Unit -> Lazy (Unit -> Unit) -> Unit
f5 u g = g u

-- work-around for issue 2936

switch : Bool -> Lazy (Nat -> Nat)
switch True  = \k => k
switch False = \k => 0

-- This does not
switch3 : Bool -> (Nat, Nat, Nat) -> (Nat, Nat, Nat)
switch3 b = let f = switch b
        in \(x,y,z) => (f x, f y, f z)
