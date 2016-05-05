use LWP::Simple;

if ($#ARGV != 0) {
	die("usage: perl msearch.pl pattern\n");
}

$pattern = $ARGV[0];

# Turn the pattern into regexp
$pattern =~ s/C/[bBdDfghHjklmnNpQrsStTvwxyzZ'-]/g;
$pattern =~ s/V/[aeiouEOU]/g;
$pattern =~ s/P/[SZ]/g;
$pattern =~ s/I/[ieUO]/g;
$pattern =~ s/\$/(-?)\$/g;
print "searching for $pattern.\n";
open F, "./mafa.txt" or die "File couldn't be opened!\n";
$i = 1;$j = 2;
while ($line = <F>) {
	if ($line =~ /$pattern/) {
		$i++;} 
	else {
		print "$line\n";
		}
	$j++;
}
print "$i of $j items.\n";

close F;