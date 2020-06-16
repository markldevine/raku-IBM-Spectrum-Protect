#!/usr/bin/env raku

use Async::Command::Interactive;

my $command-directive = 'test string';
my &parser = sub p (Str:D $return-record) { say "parser running"; $*OUT.put: $return-record }

#my @command-base = '/usr/bin/cat', '-n';
#my Async::Command::Interactive $cmd .= new(:@command-base);

my Async::Command::Interactive $cmd .= new(:command-base('/usr/bin/cat', '-n'));
$cmd.submit(&parser, $command-directive);
