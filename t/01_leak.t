use strict;
use warnings;
use Linux::Prctl::XS qw(:all);
use constant HAS_LEAKTRACE => eval{ require Test::LeakTrace };
use POSIX qw(:signal_h);
use Test::More HAS_LEAKTRACE ? (tests => 1) : (skip_all => 'require Test::LeakTrace');
use Test::LeakTrace;

leaks_cmp_ok{
	set_name("myproc");
	get_name();
	set_pdeathsig(SIGTERM);
	get_pdeathsig();
} '<', 1;
