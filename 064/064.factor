USING: math math.ranges sequences ;
IN: project-euler-problems.064

TUPLE: cont-frac
    { whole integer }
    { num-const integer }
    { denom integer } ;
C: <cont-frac> cont-frac

<PRIVATE

: step ( cont-frac -- cont-frac ) ;

: find-period ( n -- period ) 1 + ;

: try-all ( -- n ) 2 13 [a,b]
    [ find-period ] map
    [ odd? ] filter ;

PRIVATE>

: euler064a ( -- n ) try-all ;