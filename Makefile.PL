use inc::Module::Install;
name 'Linux-Prctl-XS';
all_from 'lib/Linux/Prctl/XS.pm';

die 'OS unsupported' unless $^O && $^O eq 'linux';
can_cc or die "This module requires a C compiler";
makemaker_args(
    OBJECT => '$(O_FILES)',
    clean => {
        FILES => q{
            *.stackdump
            *.gcov *.gcda *.gcno
            *.out
            nytprof
            cover_db
        },
    },
);

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
#use_test_base;
auto_include;
author_tests('xt');
sign;
WriteAll;
