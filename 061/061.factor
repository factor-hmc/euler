! Copyright (C) 2019 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.parser prettyprint sequences ;
IN: project-euler.061

! polygonal number generators, return nth polygonal num
: triangle-num ( x -- x ) dup 1 + * 2 / ;
: square-num ( x -- x ) dup * ;
: pentagonal-num ( x -- x ) dup 3 * 1 - * 2 / ;
: hexagonal-num ( x -- x ) dup 2 * 1 - * ;
: heptagonal-num ( x -- x ) dup 5 * 3 - * 2 / ;
: octagonal-num ( x -- x ) dup 3 * 2 - * ;

: 4dig-trinum ( -- seq ) { 1 2 3 } ; ! while loops are a mystery to me

! checks if the first 2 chars of str1 are the 2nd 2 chars of str2
: one-way? ( str1 str2 -- ? ) 2dup
        first swap third =
            [ 2dup second swap fourth = 
                [ 2drop t ]
                [ 2drop f ] if ]
            [ 2drop f ] if ;

! cyclic helper-- intakes strings to split up digits
: neighbors? ( str1 str2 -- ? ) 2dup
        one-way?
            [ 2drop t ]
            [ swap one-way? ] if ;

! tests if a list of numbers is cyclic (not actually implemented)
: cyclic? ( seq -- ? ) [ number>string ] map
        drop f ;
