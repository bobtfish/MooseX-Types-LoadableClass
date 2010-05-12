use strict;
use warnings;
use FindBin ();
use lib $FindBin::Bin . '/lib';

use Test::More;
use Moose::Util::TypeConstraints;

# 14:48 <rafl> but i wonder if you did it right
# 14:48 <rafl> i.e. if ClassName->is_type_of(LoadableClass) should be true
# 14:48 <rafl> for the LoadableClass value of ClassName
# 14:49 <t0m> ah, you're entirely correct, as usual :P
# 14:50 <rafl> no, i'm really not sure at all
# 14:51 <t0m> yes, I think it should be true. But it only matters if you're checking is_type_of(LoadableClass), whilst migrating things from ClassName (mine) => LoadableClass
# 14:51 <t0m> it would be helpful if one was a type of the other so you don't have to switch everything at once.
# 14:51 <rafl> no, it matters when doing typemap sort of things
# 14:51 <rafl> where you tell the typemap you want to handle LoadableClass
# 14:52 <rafl> but some code you're introspecting or whatever still uses ClassName
# 14:52 <t0m> Also true.

use MooseX::Types::LoadableClass qw/LoadableClass ClassName/;

ok ClassName->is_a_type_of(LoadableClass);

done_testing;

