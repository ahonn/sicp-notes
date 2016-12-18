;;  Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value (x/y^2+2y)/3

(define (cube x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x))
      0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
                  x)))

(define (cube-root x)
  (cube-root-iter 1.0 x))