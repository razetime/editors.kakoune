USING: editors io.standard-paths kernel make math.parser
namespaces sequences strings ;
IN: editors.kakoune

TUPLE: kakoune ;
T{ kakoune } editor-class set-global

SYMBOL: kakoune-path

HOOK: find-kakoune-path editor-class ( -- path )

M: kakoune find-kakoune-path "kak" ?find-in-path ;

: actual-kakoune-path ( -- path )
    \ kakoune-path get [ find-kakoune-path ] unless* ;

M: kakoune editor-command ( file line -- command )
    [
        actual-kakoune-path dup string? [ , ] [ % ] if
        
    ] { } make ;

M: vim editor-detached? f ;