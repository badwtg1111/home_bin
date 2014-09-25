#!/usr/bin/env perl

# Script to convert grep command-line args to ack and execute them.
# Useful when configured as Geany's 'Grep' tool.

use strict;
use warnings;

my $prev = "";
my @args;

foreach my $arg (@ARGV) {
	if ($arg ne '--' and $prev ne '--' and ($arg =~ m/^-[^-]/)) {
		# convert options
		$arg =~ s/[n]//g;
		(!($arg =~ m/r/)) and $arg .= 'n';
		$arg =~ s/[IEr]//g;
		$arg =~ s/F/Q/g;
	}
	push(@args, $arg);

	# make argument after '--' the last one
	last if ($prev eq '--');
	$prev = $arg;
}
# prepend command and common options
foreach my $arg (reverse split(/ /, "ack --nogroup --nobinary --sort-files")) {
	@args = ($arg, @args);
}
#~ print join(' ', @args);exit;	# debug

# FIXME: this hangs geany until searching is finished
exec @args;
