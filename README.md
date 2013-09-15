#Introduction
This repository is an example for getting a Catalyst application up and running on Openshift using FastCGI with nginx.

My specific configuration files can be found in conf. 

The OpenShift `diy` cartridge documentation can be found at:

https://github.com/openshift/origin-server/tree/master/cartridges/openshift-origin-cartridge-diy/README.md

Followed directions for perl here: https://github.com/dns/DIY-Perl-OpenShift-Cartridge

Followed directions for nginx here: https://www.openshift.com/blogs/lightweight-http-serving-using-nginx-on-openshift

Run CPAN
rhc ssh name-of-app
cd ~/app-root/data/perl-new/bin
HOME=~/app-root/data/ ./perl cpan

#Catalyst Development Server
install Term::ReadKey Catalyst::Devel Catalyst::ScriptRunner Log::Log4perl::Catalyst Catalyst::Restarter Catalyst::View::TT

#For FastCGI with nginx
FCGI
FCGI::ProcManager

I tried to get all the modules, but I probably missed a few.

#Debugging
rhc ssh name-of-app
cd $OPENSHIFT_DATA_DIR
cat $OPENSHIFT_REPO_DIR/.openshift/action_hooks/start $OPENSHIFT_REPO_DIR/.openshift/action_hooks/stop > restart.sh
chmod 777 restart.sh

...make some changes to conf/nginx here or whatever ...

./restart.sh

much faster than pushing everything to git each time. ;)
