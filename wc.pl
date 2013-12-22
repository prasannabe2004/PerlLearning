
open(INFILE,$ARGV[0]);


$line_count = 0;

$word_count = 0;



while ($line = <INFILE>) 
{

$line_count++;

@words_on_this_line = split(" ",$line);

print @words_on_this_line, "\n";

$word_count += scalar(@words_on_this_line);

}



print "The file contains ",$line_count," lines and ", $word_count, " words\n";

