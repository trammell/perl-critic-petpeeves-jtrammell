use Test::More tests => 2;

diag("Testing Perl::Critic::PetPeeves::JTRAMMELL $Perl::Critic::PetPeeves::JTRAMMELL::VERSION, Perl $], $^X");

use_ok('Perl::Critic::PetPeeves::JTRAMMELL');
use_ok('Perl::Critic::Policy::Variables::ProhibitUselessInitialization');

