# $Id:$
# $URL:$

package Perl::Critic::Policy::Variables::ProhibitUselessInitialization;

use strict;
use warnings;
use base 'Perl::Critic::Policy';
use Perl::Critic::Utils ':severities';

our $VERSION = '0.01';

=pod

=head1 NAME

Perl::Critic::Policy::Variables::ProhibitUselessInitialization

=head1 DESCRIPTION

Don't clutter your code with unnecessary variable initialization:

    my $scalar = undef;     # don't do this
    my @array  = ();        # or this
    my %hash   = ();        # or this

Instead, do this:

    my $scalar;             # equivalent
    my @array;              # ditto
    my %hash;               # ...

=head1 AUTHOR

John Trammell <johntrammell -at- gmail -dot- com>

=head1 COPYRIGHT

Copyright (c) John Joseph Trammell.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.  The full text of this license
can be found in the LICENSE file included with this module.

=cut

=head2 description

=cut

sub description {
    'useless variable initialization';
}

=head2 supported_parameters

=cut

sub supported_parameters {
    return ();
}

=head2 default_severity

=cut

sub default_severity {
    return $SEVERITY_LOW;
}

=head2 default_themes

=cut

sub default_themes {
    return qw(bugs JTRAMMELL);
}

=head2 applies_to

=cut

sub applies_to {
    return 'PPI::Statement::Variable';
}

=head2 violates

=cut

sub violates {
    my ($self, $elem, undef) = @_;
    if ($elem->type() eq 'local' && !_is_initialized($elem)) {
        return $self->violation(description(), [], $elem);
    }
    return;
}

sub _is_initialized {
    my $elem = shift;
    my $wanted = sub { $_[1]->isa('PPI::Token::Operator') && $_[1] eq q{=} };
    return $elem->find( $wanted ) ? 1 : 0;
}

42;

