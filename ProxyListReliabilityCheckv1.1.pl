use LWP::UserAgent;
use HTTP::Response;

# Create User Agent for making HTTP GET requests
my $ua = LWP::UserAgent->new();
$ua->agent('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 ( .NET CLR 3.5.30729)'); # Set User Agent to acceptable string for Google to avoid error.


$hitcounter=0; #Count number of good proxies validated so far
$needed=10;  #Stop after we find this many good proxies


########################################################
# CHECK FOR SUFFICIENT NUMBER OF COMMAND LINE ARGUMENTS
########################################################
if ( !(scalar(@ARGV) == 1)) { die "

       +================================================+
       |   ProxyListReliabilityCheck.pl - Version 1.1   |
       |           By: Fran 'Danger' Brown              |
       |     Bishop Fox - http://www.bishopfox.com      |
       |             Updated: 04July2017                |
       |     Tests Reliability of Open Web Proxies      |
       +================================================+
   
\tHome:
\t\thttps://github.com/BishopFox/ProxyListReliabilityCheck


\tUsage:
\t\tperl ProxyListReliabilityCheck.pl [proxie_list_to_test.txt]


\tInputs:
\t\tproxie_list_to_test.txt - list of IPAddress:Port of open web proxies to test (1 per line)


\tOutputs: 
\t\tgoodproxies.txt , logfile.txt
\t\tNote - Also prints GOOD PROXY to screen while testing if proxy is good.


\tLogic:
\t\tAttempts to crawl to the following URL through each target proxy:
\t\thttp://www.bishopfox.com/files/tools/googlediggity/other/Fhqwhgads.txt

\t\tStrong Bad Emails: Everybody to the Limit - YouTube
\t\t\thttp://www.youtube.com/watch?v=s-WTbGupxbk

\t\tIf it receives a 200 OK within a 6 second timeout and 
\t\tthe text \'everybody2daLim1t\' is found on the returned page,
\t\tthen it is considered a reliable open web proxy.


\tBishop Fox - Google Hacking Diggity Project:
\t\thttp://www.bishopfox.com/resources/tools/google-hacking-diggity/attack-tools/


\tOpen Proxy Lists:
\t\thttp://www.hidemyass.com/proxy-list/
\t\thttp://www.publicproxyservers.com/
\t\thttp://www.google.com/search?q=+\":8080\" +\":3128\" +\":80\" filetype:txt 
\t\thttp://www.dmoz.org/Computers/Internet/Proxying_and_Filtering/Hosted_Proxy_Services/Free/Proxy_Lists/


\tOther Proxy Checker Tools:
\t\thttp://www.edge-security.com/soft/proxyfinder-0.3.pl
\t\thttp://www.softsea.com/review/Proxy-Checker-Lite.html


";}

$| = 1;	# Set outputs to auto-flush

$inputfile = @ARGV[0];

open (INPUT, "<$inputfile") or die "Could not open input file.\n";
open (OUT, ">goodproxies.txt") or die "Could not open output file.\n";
open (LOGFILE, ">logfile.txt") or die "Could not open log file.\n";


print "\nStarting connection test on proxy list...\n\n";

$ua->timeout(6); # Change default timeout from 180sec (3 minutes) to just 6 seconds

foreach my $listitem (<INPUT>) {
		
		chomp($listitem); # remove newline character

		print "Trying: $listitem\n";
		
		# Set proxy
		$temproxy = 'http://' . $listitem . '/';
		$ua->proxy('http', $temproxy);
		
		# Test URL to try and fetch through the proxy
		$url = 'http://www.bishopfox.com/files/tools/googlediggity/other/Fhqwhgads.txt';
		
		# Make the HTTP request through the proxy
		my $response = $ua->get($url);
		my $content = $response->content;	
		my $status = $response->status_line;

		# Logging attempts and results
		print LOGFILE "Trying: $listitem\t";
		print LOGFILE "HTTP Status=$status\t";
		

		# If received a return status of 200OK and the page contains the correct
		# text (i.e. page is unaltered) then it the proxy is good
		#if (($status =~ '200') && ($content =~ Fhqwhgads)) {
		if (($status =~ '200') && ($content =~ everybody2daLim1t)) {
			#Proxy is good
			print OUT "$listitem\n";
			print "\tGOOD PROXY: $listitem\n";
			print LOGFILE "GOOD Proxy";
			$hitcounter++; # tracking number of good proxies found
		}
		
		print LOGFILE "\n"; # go to next line in the log file
		
		if ($hitcounter >= $needed){
			close(OUT);
			print "\n\n***Found Needed Number ($needed total) of Good Proxies - Writing Results to goodproxies.txt\n\n";
			print LOGFILE "\n\n***Found Needed Number ($needed total) of Good Proxies - Writing Results to goodproxies.txt\n\n";
			exit;
		}
	}
	
	close(OUT);
	close(LOGFILE);
