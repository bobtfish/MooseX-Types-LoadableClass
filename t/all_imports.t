use strict;
use warnings;
use FindBin ();
use lib $FindBin::Bin . '/lib';

use Test::More;
use Moose::Util::TypeConstraints;

# LoadableClass and ClassName should be exactly the same thing for
# type mappers to get it right when you're switching from one to another.

use MooseX::Types::LoadableClass qw/LoadableClass ClassName/;

foreach my $prefix ('is_', 'to_', '') {
    foreach my $name (qw/LoadableClass ClassName/) {
        my $thing = $prefix . $name;
        ok __PACKAGE__->can($thing), "Exports $thing";
    }
}

done_testing;

