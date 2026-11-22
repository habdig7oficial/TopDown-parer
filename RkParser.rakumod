grammar RkParser {
    token sig_t { '+' | '-' } # Signals for the Z -> *FZ and Z -> /FZ rules
    token sig_z { '*' | '/' } # Signals for the K -> +TK  and K -> -TK rules

    rule i { <s> } # Implements I -> S
    rule s { <t> <k> } # Implements S -> TK.

    rule t { <f> <z> } # Implements T -> FZ.

    rule k { <sig_t> <t> | '' } # Combines K -> +TK and K -> -TK rules. K -> ε
    rule z { <sig_z> <f> | '' } # Combines Z -> *FZ and Z -> /FZ. Z -> ε.

    token n { <[1..9]> | <d>+ } # N -> 1D|2D|3D|4D|5D|6D|7D|8D|9D 
    token d { '0' | <[1..9]> } # D -> 0D|1D|2D|3D|4D|5D|6D|7D|8D|9D 

    token f { <n> | '-' <n> | '(' <s> ')'} # Implements F -> (S), F -> N, F -> -N   

    rule TOP { <i> } # Initial symbol I.
}

