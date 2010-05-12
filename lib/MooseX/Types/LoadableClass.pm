package MooseX::Types::LoadableClass;
use strict;
use warnings;
use MooseX::Types -declare => [qw/ ClassName LoadableClass /];
use MooseX::Types::Moose qw/Str/;
use Moose::Util::TypeConstraints;
use Class::MOP ();
use namespace::clean -except => [qw/ import /];

our $VERSION = '0.003';
$VERSION = eval $VERSION;

subtype LoadableClass, as 'ClassName', where { 1 };
coerce LoadableClass, from Str, via { Class::MOP::load_class($_); $_ };

__PACKAGE__->type_storage->{ClassName} = __PACKAGE__->type_storage->{LoadableClass};

__PACKAGE__->meta->make_immutable;
1;
__END__

=head1 NAME

MooseX::Types::LoadableClass - ClassName type constraint with coercion to load the class.

=head1 SYNOPSIS

    package MyClass;
    use Moose;
    use MooseX::Types::LoadableClass qw/ LoadableClass /;

    has foobar_class => (
        is => 'ro',
        required => 1,
        isa => LoadableClass,
        coerce => 1,
    );

    MyClass->new(foobar_class => 'FooBar'); # FooBar.pm is loaded or an
                                            # exception is thrown.

=head1 DESCRIPTION

    use Moose::Util::TypeConstraints;

    my $tc = subtype as ClassName;
    coerce $tc, from Str, via { Class::MOP::load_class($_); $_ };

I've written those three lines of code quite a lot of times, in quite
a lot of places.

Now I don't have to.

=head1 AUTHOR

Tomas Doran (t0m) C<< <bobtfish@bobtfish.net> >>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2010 the above named authors.

Licensed under the same terms as perl itself.

=cut

