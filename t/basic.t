use strict;
use warnings;
use FindBin ();
use lib $FindBin::Bin . '/lib';

use Test::More;
use Test::Exception;
use Class::MOP ();

{
    package MyClass;
    use Moose;
    use MooseX::Types::LoadableClass qw/LoadableClass/;

    has foobar_class => (
        is => 'ro',
        required => 1,
        isa => LoadableClass,
        coerce => 1,
    );
}

ok !Class::MOP::is_class_loaded('FooBarTestClass');
lives_ok { MyClass->new(foobar_class => 'FooBarTestClass') };
ok Class::MOP::is_class_loaded('FooBarTestClass');

dies_ok { MyClass->new(foobar_class => 'FooBarTestClassDoesNotExist') };

done_testing;

