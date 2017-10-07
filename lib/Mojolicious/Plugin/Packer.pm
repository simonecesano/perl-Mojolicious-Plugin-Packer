use strict;
use warnings;
package Mojolicious::Plugin::Packer;

use Mojo::Base 'Mojolicious::Plugin';
use Carp;

use JavaScript::Packer;
use HTML::Packer;
use CSS::Packer;

my $jsp   = JavaScript::Packer->init();
my $htmlp = HTML::Packer->init();
my $cssp  = CSS::Packer->init();


sub register {
    my ($self, $app, $config) = @_;
    $app->helper('jspack' => sub {
		     shift;
		     my $js = (shift)->()->unindent->to_string;
		     return $jsp->minify(\$js)
		 });
    $app->helper('csspack' => sub {
		     shift;
		     my $css = (shift)->()->unindent->to_string;
		     return $cssp->minify(\$css, { compress => 'minify'})
		 });
    $app->helper('htmlpack' => sub {
		     shift;
		     my $html = (shift)->()->unindent->to_string;
		     return $htmlp->minify(\$html);
		     $html
		 });
}

1;

__DATA__
