use strict;
use warnings;
use Linux::Prctl::XS qw(:all);
use constant HAS_LEAKTRACE => eval{ require Test::LeakTrace };
use Test::More HAS_LEAKTRACE ? (tests => 1) : (skip_all => 'require Test::LeakTrace');
use Test::LeakTrace;

leaks_cmp_ok{
	pr_set_name("myproc");
	pr_get_name();
} '<', 1;
