#!/usr/bin/perl -w
# serverIO.pl - a simple server using
# IO::Socket
use strict;
use IO::Socket;
my $sock = new IO::Socket::INET(
                   LocalHost => 'localhost',
                   LocalPort => 7890,
                   Proto     => 'tcp',
                   Listen    => SOMAXCONN,
                   Reuse     => 1);
$sock or die "no socket :$!";
my($new_sock, $c_addr, $buf);
while (($new_sock, $c_addr) = $sock->accept()) {
    my ($client_port, $c_ip) =
                     sockaddr_in($c_addr);
    my $client_ipnum = inet_ntoa($c_ip);
    my $client_host =
             gethostbyaddr($c_ip, AF_INET);
    print "got a connection from: $client_host",
          " [$client_ipnum]\n";
    while (defined ($buf = <$new_sock>)) {
        print $buf;
    }
}

