#!/usr/bin/perl -w
# clientIO.pl - a simple client using
# IO::Socket
use strict;
use IO::Socket;
my $host = shift || '127.0.0.1';
my $port = shift || 7890;
my $sock = new IO::Socket::INET(
                   PeerAddr => $host,
                   PeerPort => $port,
                   Proto    => 'tcp');
$sock or die "no socket :$!";

foreach my $i (1..10) {
    print $sock "hello, world: $i\n";
}


close $sock;

