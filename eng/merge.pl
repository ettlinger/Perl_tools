use LWP::Simple;

open F, "./fr.txt" or die "File couldn't be opened!\n";
$i = 0;$j = 0;
while ($line = <F>) {
	if ( ($word, $pos, $count) = ($line =~ /^\s*(\S+)\s+(\S+)\s*(\S+)/ ) ) {
		$uword = uc $word;
open G, "./wordspron.txt" or die "File couldn't be opened!\n";
		while ($pronline=<G>) {
			if ( ($lword, $pron) = ($pronline =~ /^(\S+)\s*(.*)/) ) {
#				print "<$uword>?=<$lword>";
				if ($uword eq $lword) {
					print " $pron ";

				}
			}
		}
		print "$count $word";
		print "\n";
close G;
	}
}
close F;
