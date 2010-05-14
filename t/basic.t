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
    use MooseX::Types::LoadableClass qw/LoadableClass LoadableRole/;

    has foobar_class => (
        is     => 'ro',
        isa    => LoadableClass,
        coerce => 1,
    );

    has foobar_role => (
        is     => 'ro',
        isa    => LoadableRole,
        coerce => 1,
    );
}

ok !Class::MOP::is_class_loaded('FooBarTestClass');
lives_ok { MyClass->new(foobar_class => 'FooBarTestClass') };
ok Class::MOP::is_class_loaded('FooBarTestClass');

dies_ok { MyClass->new(foobar_class => 'FooBarTestClassDoesNotExist') };

ok !Class::MOP::is_class_loaded('FooBarTestRole');
lives_ok { MyClass->new(foobar_role => 'FooBarTestRole') };
ok Class::MOP::is_class_loaded('FooBarTestRole');

dies_ok { MyClass->new(foobar_role => 'FooBarTestClass') };
dies_ok { MyClass->new(foobar_role => 'FooBarTestRoleDoesNotExist') };

done_testing;
