package MyApp::Controller::Hello;
use Moose;
use namespace::autoclean;
use Data::Dumper;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyApp::Controller::Hello - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched MyApp::Controller::Hello in Hello.');
}

#sub hello :Global {
#    my ( $self, $c ) = @_;
#
#    $c->response->body("Hello, World!");
#}

sub form :Global {
    my($self, $c) = @_;

    if(defined $c->req->params){
        $c->response->body("Params are ".Dumper($c->req->params));
    }
    else{
        $c->stash(template => 'form.tt2');
    }

}

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
