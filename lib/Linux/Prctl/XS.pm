package Linux::Prctl::XS;

use strict;
use warnings;
use base qw(Exporter);
our $VERSION = '0.01';
our(@ISA, @EXPORT_OK, %EXPORT_TAGS);

eval {
    require XSLoader;
    XSLoader::load(__PACKAGE__, $VERSION);
    1;
} or do {
    require DynaLoader;
    push @ISA, 'DynaLoader';
    __PACKAGE__->bootstrap($VERSION);
};

@EXPORT_OK = qw(pr_get_name pr_set_name);
%EXPORT_TAGS = (all => \@EXPORT_OK);

1;

__END__

=pod

=head1 NAME

Linux::Prctl::XS - linux prctl interface xs module

=head1 VERSION

0.01

=head1 SYNOPSIS

  use strict;
  use warnings;
  use Linux::Prctl::XS qw(:all);
  
  # get current proc name
  my $name = pr_get_name();
  
  # change current proc name
  pr_set_name("newproc") or die "can not change proc name: $!";

=head1 DESCRIPTION

Linux::Prctl::XS is prctl interface xs module. however, only interface to PR_SET_NAME/PR_GET_NAME is being offered at present. 

=head1 METHOD

=head2 pr_get_name

get current proc name

Example:

  use Linux::Prctl::XS qw(pr_get_name);
  
  printf "current proc name: %s\n", pr_get_name();

=head2 pr_set_name

change current proc name

Example:

  use Linux::Prctl::XS qw(pr_set_name);
  
  # change current proc name
  pr_set_name("newproc") or die "can not change proc name: $!";

=head1 NOTES

This module is a version while developing at the time of test only with CentOS.

=head1 SEE ALSO

prctl(2) man page

=head1 AUTHOR

Akira Horimoto

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
