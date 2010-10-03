use strict;
use warnings;
use Linux::Prctl::XS qw(:all);
use Test::More tests => 2;

my $proc = "myproc";
ok(pr_set_name($proc) == 1);
ok($proc eq pr_get_name());
