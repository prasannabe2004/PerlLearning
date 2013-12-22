#!/usr/bin/perl -w
# server2way.pl - a server that reads from
# and writes to a client
use strict;
use IO::Socket;
use Sys::Hostname;
my $sock = new IO::Socket::INET(
                   LocalHost => 'localhost',
                   LocalPort => 7890,
                   Proto     => 'tcp',
                   Listen    => SOMAXCONN,
                   Reuse     => 1);
$sock or die "no socket :$!";

STDOUT->autoflush(1);
my($new_sock, $buf);
while ($new_sock = $sock->accept()) {
	while (defined($buf = <$new_sock>)) {
   		foreach ($buf) {
			/^HELLO$/ and
                 	print($new_sock "Hi\n"),
                 	last;
            		/^NAME$/  and
                 	print($new_sock hostname(),"\n"),
                 	last;
      	 		/^DATE$/  and
                 	print($new_sock
			scalar(localtime),"\n"),
                 	last;
       			# default case:
       			print $new_sock "DEFAULT\n";
		}
    	}
	close $new_sock;
}

