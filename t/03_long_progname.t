use strict;
use warnings;
use Linux::Prctl::XS qw(:all);
use Test::More tests => 3;

my $proc = "thisis_longproc_change";
ok(set_name($proc) == 1);
my $new_proc = get_name();
ok($proc ne $new_proc);
ok($new_proc eq substr($proc, 0, 15));
