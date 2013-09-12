The OpenShift `diy` cartridge documentation can be found at:

https://github.com/openshift/origin-server/tree/master/cartridges/openshift-origin-cartridge-diy/README.md

Followed directions for perl here: https://github.com/dns/DIY-Perl-OpenShift-Cartridge

Followed directions for nginx here: https://www.openshift.com/blogs/lightweight-http-serving-using-nginx-on-openshift

Run CPAN
cd ~/app-root/data/perl-new/bin
HOME=~/app-root/data/ ./perl cpan

install Term::ReadKey Catalyst::Devel Catalyst::ScriptRunner FCGI Log::Log4perl::Catalyst FCGI::ProcManager

For FastCGI
CatalystX::RoleApplicator
Data::Structure::Util
Catalyst::TraitFor::Request::ProxyBase
Catalyst::View::TT
FCGI
FCGI::ProcManager

Start the development server
./perl /var/lib/openshift/522f0e144382ec352300020f/app-root/runtime/repo/MyApp/script/myapp_server.pl -r -p $OPENSHIFT_DIY_PORT -h $OPENSHIFT_DIY_IP

Stop the development server
#!/bin/bash
kill `ps -ef | grep myapp_server.pl | grep -v grep | awk '{ print $2 }'` > /dev/null 2>&1
exit 0

TODO figure out fastcgi probably with nginx



