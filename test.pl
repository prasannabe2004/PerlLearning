use strict;
use IO::Socket;

my $sock = new IO::Socket::INET(LocalHost=>'localhost',LocalPort=>7890,Proto=>'tcp',Listen=>SOMAXCONN,Reuse=>1);
$sock or die "no scoket :$!";

my($new,$data,$senddata);
while(1)
{
$new=$sock->accept();
$data=<$new>;
print $data;
$senddata="hello client";
$new->send($senddata);

}

