# Author: Martin Matusiak <numerodix@gmail.com>
# Licensed under the GNU Public License, version 3.

package colors;

use strict;

use base 'Exporter';
our @EXPORT = qw(s_err s_ok s_wa s_est  s_ela s_eta  s_b s_bb s_it s_it2);


my ($black, $red, $green, $yellow, $blue, $magenta, $cyan, $white);
my ($bold, $reverse, $reset);

if (($ENV{'TERM'} ne "") and ($ENV{'TERM'} ne "dumb")) {

	# regular colors
	$black = "\e[0;30m";
	$red = "\e[0;31m";
	$green = "\e[0;32m";
	$yellow = "\e[0;33m";
	$blue = "\e[0;34m";
	$magenta = "\e[0;35m";
	$cyan = "\e[0;36m";
	$white = "\e[0;37m";

	if ($ENV{'TERM'} eq "xterm") {
		$red = "\e[0;91m";
	}

	# special codes
	$bold = "\e[0m\e[1m";
	$reverse = "\e[7m";
	$reset = "\e[0m";

}

sub s_err { return $red    . $_[0] . $reset; }
sub s_ok  { return $green  . $_[0] . $reset; }
sub s_wa  { return $yellow . $_[0] . $reset; }
sub s_est { return $cyan   . $_[0] . $reset; }

sub s_ela { return $magenta . $_[0] . $reset; }
sub s_eta { return $magenta . $reverse . $_[0] . $reset; }

sub s_b   { return $bold   . $_[0] . $reset; }
sub s_bb  { return $green  . $_[0] . $reset; }
sub s_it  { return $yellow . $_[0] . $reset; }
sub s_it2 { return $cyan   . $_[0] . $reset; }

1;
