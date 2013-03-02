#!perl

# tests for scalar part of ProhibitUselessInitialization

use strict;
use warnings;
use Test::More tests => 4;
use Perl::Critic;
use Perl::Critic::Config;
use Perl::Critic::Policy::Variables::ProhibitUselessInitialization;

# import common P::C testing tools
use lib 't/lib';
use PerlCriticTestUtils 'pcritique';

# keep my .perlcriticrc from interfering
PerlCriticTestUtils::block_perlcriticrc();

# define the tests to run
my @tests = ( # [ code, violation count ]
    [ q{ my $foo = undef; },                  1 ],
    [ q{ my $foo = 1; },                      0 ],
    [ q! my $foo = \do { my $bar }; !,        0 ],
    [ q! ( my $foo ) = $bar =~ m/pattern/; !, 0 ],
);

# run the tests
for (@tests) {
    my ($perl, $nviol) = @$_;
    my $policy = 'Variables::ProhibitUselessInitialization';
    is( pcritique($policy, \$perl), $nviol, $policy);
}

