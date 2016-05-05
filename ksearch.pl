if ($#ARGV != 0){
	die("usage: perl msearch.pl pattern\n");
}
if ($ARGV[0] =~ help) {
	die("usage: perl msearch.pl pattern\n");
}
$pattern = $ARGV[0];

# Turn the pattern into regexp
$pattern =~ s/C/[bdghklLmnNpPqstTvwxyz]/g; 	# consonants
$pattern =~ s/V/[aeEioOu]/g; 				# Vowels
print "searching for $pattern.\n";
open F, "./kt.txt" or die "File couldn't be opened!\n";
$i = 0;$j = 0;
while (<F>) {
	if (m/^(\S+)\s/){ 
		$word = $1;
		if ($word =~ /$pattern/) {
			print "$_";
			$i++;}
		$j++;
	}
}
print "$i items.";

close F;
