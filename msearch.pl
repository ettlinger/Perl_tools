use LWP::Simple;

if ($#ARGV != 0) {
	die("usage: perl msearch.pl pattern\n");
}
if ($ARGV[0] =~ help) {
	die(" C=consonant, V=vowel, P=C[+p], R=C[-p], I=V[+p], A=V[-p], G=X[-p], Y=X[+p]\n");
	}
$pattern = $ARGV[0];

# Turn the pattern into regexp
$pattern =~ s/C/[bBdDfghHjklmnNpQrsStTvwxyzZ']/g;
$pattern =~ s/F/[bBdDfghHjklmnNpQrsStTvwxyzZ]/g;
$pattern =~ s/V/[aeiouEOU]/g;
$pattern =~ s/P/[SZ]/g;
$pattern =~ s/R/[bBdDfghHjklmnNpQrstTvwxyz']/g;
$pattern =~ s/I/[ieUO]/g;
$pattern =~ s/A/[Eauo]/g;
$pattern =~ s/K/[kgh]/g;
$pattern =~ s/G/[bBdDfghHjklmnNpQrstTvwxyzEauo']/g;
$pattern =~ s/Y/[ieUOSZ]/g;
$pattern =~ s/J/[Eauosz]/g;
$pattern =~ s/\$/(\~?)\$/g;
print "searching for $pattern.\n";
open F, "./ms.txt" or die "File couldn't be opened!\n";
$i = 0;$j = 0;
while ($line = <F>) {
	if ($line =~ /$pattern/) {
		print "$line";
		$i++;}
	$j++;
}
print "$i items.";

close F;
