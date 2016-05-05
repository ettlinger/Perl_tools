use LWP::Simple;

if ($#ARGV != 0) {
	die("usage: perl msearch.pl pattern\n");
}
if ($ARGV[0] =~ help) {
	die(" c=consonant, v=vowel, P=C[+p], R=C[-p], I=V[+p], A=V[-p], G=X[-p], Y=X[+p]\n");
	}
$pattern = $ARGV[0];

# Turn the pattern into regexp
$pattern =~ s/v/[AEIOU]/g;
$pattern =~ s/c/[BCDFGHJKLMNPRSTVWXYZ]/g;
# print "searching for $pattern.\n";
open F, "./aa.txt" or die "File couldn't be opened!\n";
$i = 0;$j = 0;
while ($line = <F>) {
#		print "$line";
	if ($line =~ /$pattern/) {
		print "$line";
		$i++;}
	$j++;
}
print  "$i \t";

close F;
