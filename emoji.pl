use strict;
use warnings;
use utf8;

use Irssi;



our $VERSION = '0.0.0';
our %IRSSI = (
    authors     => 'foxiepaws',
    contact     => 'fox@foxiepa.ws',
    name        => 'irssi-emoji',
    description => 'adds tab completion for emoji in irssi.'
    license     => 'BSD 2-Clause',
);

# list of emoji.
our %emoji = (
)


sub completer {

    my ($strings, $window, $word, $linestart, $want_space) = @_;

    # we have two completion points, first is when the we match %e(: which
    # should match emoji shortnames and %e(name): should complete to the 
    # emoji.
    
    return unless ($word =~ /%e\(/);

}

Irssi::signal_add_first('complete word', \&completer);
