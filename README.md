This repository is an example for getting a Catalyst application up and running on Openshift using FastCGI with nginx.

My specific configuration files can be found in ./conf.

The OpenShift `diy` cartridge documentation can be found at:

https://github.com/openshift/origin-server/tree/master/cartridges/openshift-origin-cartridge-diy/README.md

Followed directions for perl here: https://github.com/dns/DIY-Perl-OpenShift-Cartridge

Followed directions for nginx here: https://www.openshift.com/blogs/lightweight-http-serving-using-nginx-on-openshift

Run CPAN
rhc ssh diyapp
cd ~/app-root/data/perl-new/bin
HOME=~/app-root/data/ ./perl cpan

#For just the regular development server
install Term::ReadKey Catalyst::Devel Catalyst::ScriptRunner Log::Log4perl::Catalyst Catalyst::Restarter Catalyst::View::TT

#For FastCGI with nginx
FCGI
FCGI::ProcManager

I tried to get all the modules, but I probably missed a few.

When I was debugging I put a restart.sh script in my $OPENSHIFT_DATA_DIR directory that was just a cat of my .openshift/action_hook/start and stop files. 

rhc ssh name-of-app
cd $OPENSHIFT_DATA_DIR

...make some changes to conf/nginx here or whatever ...

./restart.sh

much faster than pushing everything to git each time. ;)
