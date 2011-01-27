#!perl

use strict;
use warnings;
use Test::More tests => 2;
use Perl::Critic;
use Perl::Critic::Config;
use Perl::Critic::Policy::Variables::ProhibitUselessInitialization;

# import common P::C testing tools
use lib 't/lib';
use PerlCriticTestUtils 'pcritique';
PerlCriticTestUtils::block_perlcriticrc();

my @tests = ( # [ code, violation count ]
    [ q{ my $foo = undef; },              1 ],
    [ q{ my $foo = 1; },                  0 ],
);

for (@tests) {
    my ($perl, $nviol) = @$_;
    my $policy = 'Variables::ProhibitUselessInitialization';
    is( pcritique($policy, \$perl), $nviol, $policy);
}

