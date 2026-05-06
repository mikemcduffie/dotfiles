#!/usr/bin/perl -w -0777
# Usage: perl convert_quotes.pl input.txt output.txt
local $/ = undef;
open INFILE, $ARGV or die "I can't read the file. $!";
$string = <INFILE>;
close INFILE;
$string =~ s/(\\w)\\"/$1”/smg;
$string =~ s/\\"(\\w)/„$1/smg;
open OUTFILE, ">", $ARGV:inlineRefs{references="&#91;&#123;&quot;type&quot;&#58;&quot;inline_reference&quot;,&quot;start_index&quot;&#58;539,&quot;end_index&quot;&#58;542,&quot;number&quot;&#58;1,&quot;url&quot;&#58;&quot;https&#58;//gist.github.com/kamermans/1f871268f51d21e9930c004493eba76d&quot;,&quot;favicon&quot;&#58;&quot;https&#58;//imgs.search.brave.com/xZ1QeMRUaD4Rb2PRlguFbHNXkQKQJMGrNr6XEBVeFkc/rs&#58;fit&#58;32&#58;32&#58;1&#58;0/g&#58;ce/aHR0cDovL2Zhdmlj/b25zLnNlYXJjaC5i/cmF2ZS5jb20vaWNv/bnMvNzdmZjEzNDE3/NDlmMDc4NDRlMGJl/YTdmYzUxNGNkNDdk/OGE5YmRiOWQ0NGVl/NDU4MzZlNzg3OTYy/M2YzOTZiMS9naXN0/LmdpdGh1Yi5jb20v&quot;,&quot;snippet&quot;&#58;&quot;Replace&#32;fancy-quotes&#32;/&#32;curly-quotes&#32;/&#32;smart-quotes&#32;with&#32;standard&#32;ASCII&#32;single-&#32;and&#32;double-quotes&#32;in&#32;bash&#32;...&#32;This&#32;file&#32;contains&#32;hidden&#32;or&#32;bidirectional&#32;Unicode&#32;text&#32;that&#32;may&#32;be&#32;interpreted&#32;or&#32;compiled&#32;differently&#32;than&#32;what&#32;appears&#32;below.&#32;To&#32;review,&#32;open&#32;the&#32;file&#32;in&#32;an&#32;editor&#32;that&#32;reveals&#32;hidden&#32;Unicode&#32;characters.&#32;Learn&#32;more&#32;about&#32;bidirectional&#32;Unicode&#32;characters&#32;...&#32;Also,&#32;for&#32;the&#32;record,&#32;Mac&#32;user…&quot;&#125;&#93;"} or die "I can't write to the file. $!";
print OUTFILE ($string);
close OUTFILE;