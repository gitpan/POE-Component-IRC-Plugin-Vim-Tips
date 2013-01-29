#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'POE::Component::IRC::Plugin::Vim::Tips' ) || print "Bail out!\n";
}

diag( "Testing POE::Component::IRC::Plugin::Vim::Tips $POE::Component::IRC::Plugin::Vim::Tips::VERSION, Perl $], $^X" );
