use strict;
use warnings;
use Linux::Prctl::XS qw(:all);
use POSIX qw(:signal_h);
use Errno;
use Test::More tests => 4;

ok(set_pdeathsig(SIGKILL) == 1);
ok(get_pdeathsig == SIGKILL);
ok(set_pdeathsig(99999) == 0);
ok(Errno::EINVAL == $!)
