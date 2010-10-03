use strict;
use warnings;
use Linux::Prctl::XS qw(:all);
use Test::More tests => 3;

my $proc = "thisis_longproc_change";
ok(pr_set_name($proc) == 1);
my $new_proc = pr_get_name();
ok($proc ne $new_proc);
ok($new_proc eq substr($proc, 0, 15));
