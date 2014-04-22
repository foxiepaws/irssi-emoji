use strict;
use warnings;
use utf8;
use Irssi;


our $VERSION = '0.0.0';
our %IRSSI = (
    authors     => 'foxiepaws',
    contact     => 'fox@foxiepa.ws',
    name        => 'irssi-emoji',
    description => 'adds tab completion for emoji in irssi.',
    license     => 'BSD 2-Clause',
);

# list of emoji.
our %emoji = (
    unamused => "\x{1F612}"
);


sub completer {
    my ($strings, $window, $word, $linestart, $want_space) = @_;

    # we have two completion points, first is when the we match %e(: which
    # should match emoji shortnames and %e(name): should complete to the
    # emoji.

    return unless ($word =~ /%e\(/);

    if ($word =~ /%e\(([a-zA-Z_1-9]+)/) {
        @$strings = map {"%e(" . $_ } grep {/^$1/} keys %emoji; # get all the keys in %emoji and filter by 
                                                                # $word, then add the `%e(' 
        $$want_space = 0;
        Irssi::signal_stop();
    }
    # replace string with character.
    if ($word =~ /%e\((\w+)\)/) {
        push @$strings, $emoji{$1};
        $$want_space = 1;
        Irssi::signal_stop();
    }
}

Irssi::signal_add_first('complete word', \&completer);
