use strict;
use warnings;
use Linux::Prctl::XS qw(:all);
use Test::More tests => 2;

my $proc = "myproc";
ok(set_name($proc) == 1);
ok($proc eq get_name());
