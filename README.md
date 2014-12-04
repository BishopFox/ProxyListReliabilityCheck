ProxyListReliabilityCheck
=========================

Perl script to test the reliability of a list of open web proxies.

The script takes in a text file list of IPAddress:Port of open web proxies to test (1 per line).  It then attempts to crawl to the following URL through each target proxy:
* http://www.bishopfox.com/files/tools/googlediggity/other/Fhqwhgads.txt

If it receives a 200 OK within a 6 second timeout and the text 'Fhqwhgads' is found on the returned page (showing that the proxy isn't posting a login prompt, error message, or altering the content), then it is considered a reliable open web proxy.

This is basically the same method that is used by the SearchDiggity tool to validate the GOOD/BAD reliability of a list of open web proxies to use.  For more info on SearchDiggity, see:
* http://www.bishopfox.com/resources/tools/google-hacking-diggity/attack-tools/#searchdiggity-v-3

Note: Testing of the script was used with ActiveState Perl:
* http://www.activestate.com/activeperl/downloads


## Usage
