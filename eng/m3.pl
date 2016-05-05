use LWP::Simple;

open (OUTP, ">ff");
open F, "./f2.txt" or die "File couldn't be opened!\n";
$i = 0;$j = 0;
print OUTP "Starting\n";
