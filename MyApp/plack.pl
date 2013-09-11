#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  plack.pl
#
#        USAGE:  ./plack.pl  
#
#  DESCRIPTION:  
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  YOUR NAME (), 
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  09/11/2013 08:26:13 AM
#     REVISION:  ---
#===============================================================================

#use strict;
#use warnings;

use Plack::Runner;
use Data::Dumper;


# For some reason Apache SetEnv directives dont propagate
# correctly to the dispatchers, so forcing PSGI and env here 
# is safer.
#set apphandler => 'PSGI';
#set environment => 'production';

my $psgi = 'script/myapp_server.pl';
die "Unable to read startup script: $psgi" unless -r $psgi;

my $runner = Plack::Runner->new();

push @ARGV, ('listen 8080');

$runner->parse_options(@ARGV);
print Dumper($runner);

$runner->run($psgi);
