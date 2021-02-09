#!/usr/bin/env raku
multi find-ips(Str $input where / \d ** 4..12 /) {
    gather {
        take .list.flat.join('.')
        for $input ~~ m:exhaustive
            / ^ ( <[1..9]> ** 0..2 \d <?{ $/.Int < 256 }> ) ** 4 $ /
    }
}

multi find-ips(Str $input) {
    note "Sorry: {$input} is not a valid input, it should be 4 to 12 digits.";
    exit
}

sub MAIN(Str $input) {
    CATCH { default { .say } }

    my @ips = find-ips($input);
    say "Found {+@ips} potential IP address{+@ips == 1 ?? '' !! 'es'} in {$input}:";
    say @ips.join("\n").indent(4);
}
