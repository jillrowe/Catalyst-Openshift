use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyApp';
use MyApp::Controller::Hello;

ok( request('/hello')->is_success, 'Request should succeed' );
done_testing();
