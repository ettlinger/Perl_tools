use LWP::Simple;

if ($#ARGV != 0) {
	die("usage: perl msearch.pl pattern\n");
}
if ($ARGV[0] =~ help) {
	die(" c=consonant, v=vowel, P=C[+p], R=C[-p], I=V[+p], A=V[-p], G=X[-p], Y=X[+p]\n");
	}
$pattern = $ARGV[0];

# Turn the pattern into regexp
$pattern =~ s/v/(A|E|I|O|U)/g;
$pattern =~ s/c/(B|C|D|F|G|H|J|K|L|M|N|P|R|S|T|V|W|X|Y|Z)/g;
$pattern =~ s/p/(P|B|F|V|M|W)/g;
$pattern =~ s/t/(T|D|S|Z|N|L|R|SH)/g;
$pattern =~ s/k/(K|G|H)/g;
$pattern =~ s/y/(CH|JH|Y)/g;
$pattern =~ s/d/(DH|TH)/g;
open F, "./aa.txt" or die "File couldn't be opened!\n";
$i = 0;$j = 0;
 print "$pattern\n";
while ($line = <F>) {
#		print "$line";
	if ($line =~ /$pattern/) {
		$x = $line;
		print "$x";
		$x =~ s/.*\s([0-9]+)\s.*/$1/g;
		$i = $i + $x;}
	$j++;
}
if ($i > 0) {
	$pattern =~ /..([A-Z]+).*([A-Z]+)/;
        print "$1$2\t";
	print  "$i \n";
}
close F;
