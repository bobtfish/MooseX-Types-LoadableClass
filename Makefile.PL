use strict;
use warnings;
use inc::Module::Install;
use Module::Install::AuthorRequires;
use Module::Install::AuthorTests;

name 'MooseX-Types-LoadableClass';
all_from 'lib/MooseX/Types/LoadableClass.pm';

requires 'MooseX::Types';

test_requires 'Moose';
test_requires 'Test::More' => '0.88';

author_requires 'Test::EOL' => '0.6';
author_requires 'Test::NoTabs';
author_requires 'Test::Pod' => '1.14';
author_requires 'Test::Pod::Coverage' => '1.08';

tests 't/*.t';
author_tests 't/author';

if ($Module::Install::AUTHOR) {
    system("pod2text lib/MooseX/Types/LoadableClass.pm > README") and die;
}

WriteAll;

