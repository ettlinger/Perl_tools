use LWP::Simple;

open (OUTP, ">ff");
open F, "./f2.txt" or die "File couldn't be opened!\n";
$i = 0;$j = 0;
print OUTP "Starting\n";
while ($line = <F>) {
	if ( ($word, $pos, $count) = ($line =~ /^\s*(\S+)\s+(\S+)\s*(\S+)/ ) ) {
		$uword = uc $word;
open G, "./w2.txt" or die "File couldn't be opened!\n";
		while ($pronline=<G>) {
			if ( ($lword, $pron) = ($pronline =~ /^(\S+)\s*(.*)/) ) {
#				print "<$uword>?=<$lword>";
				if ($uword eq $lword) {
					print OUTP "$pron ";

				}
			}
		}
		print OUTP "$count $word";
		print OUTP "\n";
close G;
	}
}
close F;
