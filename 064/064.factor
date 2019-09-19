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


! (√n + a)/b
TUPLE: cfrac n a b ;

C: <cfrac> cfrac

! helper functions
<PRIVATE

! (√n + a) / b = 1 / (k + (√n + a') / b')
!
! b / (√n + a) = b (√n - a) / (n - a^2) = (√n - a) / ((n - a^2) / b)
:: reciprocal ( fr -- fr' )
    fr n>>
    fr a>> neg
    fr n>> fr a>> sq - fr b>> /
    <cfrac>
    ;

:: split ( fr -- k fr' )
    fr n>> sqrt fr a>> + fr b>> / >integer
    dup fr n>> swap
    fr b>> * fr a>> swap -
    fr b>>
    <cfrac>
    ;

: pure ( n -- fr )
    0 1 <cfrac>
    ;

: next ( fr -- fr' )
    reciprocal split nip
    ;

:: period ( n -- per )
    n pure split nip :> start
    n sqrt >integer sq n =
    [ 0 ]
    [ 1 start next
      [ dup start = not ]
      [ next [ 1 + ] dip ]
      while
      drop
    ] if
    ;

PRIVATE>

: euler064b ( -- ct )
    1 10000 [a,b]
    [ period odd? ] count
    ;
