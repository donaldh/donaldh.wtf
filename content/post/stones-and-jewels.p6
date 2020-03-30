#!/usr/bin/env perl6

sub MAIN(Str $stones, Str $jewels) {
    my $found = [+] $stones.comb.Bag{ $jewels.comb(/<[A..Z a..z]>/).Bag.keys };
    say "There are {$found} jewels to be found";
}
