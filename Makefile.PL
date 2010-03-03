use strict;
use warnings;
use inc::Module::Install;

name 'MooseX-Types-LoadableClass';
all_from 'lib/MooseX/Types/LoadableClass.pm';

requires 'MooseX::Types';

test_requires 'Moose';
test_requires 'Test::More' => '0.88';

WriteAll;

