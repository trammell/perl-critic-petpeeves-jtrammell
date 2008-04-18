use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Perl::Critic::PetPeeves::JTRAMMELL',
    license             => 'perl',
    dist_author         => 'Holmescorp Software Dev Team <softwaredevelopment@holmescorp.com>',
    dist_version_from   => 'lib/Perl/Critic/PetPeeves/JTRAMMELL.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Perl-Critic-PetPeeves-JTRAMMELL-*', '*.bak' ],
);

$builder->create_build_script;
