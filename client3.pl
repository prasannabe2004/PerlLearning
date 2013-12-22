#!/usr/bin/perl -w
# client2way.pl - a client that writes to
# and reads from a server
use strict;
use IO::Socket;
my $host = shift || '127.0.0.1';
my $port = shift || 7890;
my $sock = new IO::Socket::INET(
                  PeerAddr => $host,
                  PeerPort => $port,
                  Proto    => 'tcp');
$sock or die "no socket :$!";

print "Sending.....HELLO\n";
print $sock "HELLO\n";

print scalar <$sock>;
print "Recevied...\n";

print "Sending.....NAME\n";
print $sock "NAME\n";

print scalar <$sock>;
print "Recevied...\n";

print "Sending.....DATE\n";
print $sock "DATE\n";

print scalar <$sock>;
print "Recevied...\n";

print "Sending.....NONE\n";
print $sock "NONE\n";

print scalar <$sock>;
print "Recevied...\n";

close $sock;

