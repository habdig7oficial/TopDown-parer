use lib '.';
use RkParser;
use Test;


for @*ARGS -> $arg {
    say '=================';
    say $arg;
    say '=================';
    for $arg.IO.lines -> $line {
        say "input: $line"
        my $res = RkParser.parse($line);
        ok $res;
        say $res;
        say '=================';
    }
}
