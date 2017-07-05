ProxyListReliabilityCheck
=========================

Perl script to test the reliability of a list of open web proxies.

The script takes in a text file list of IPAddress:Port of open web proxies to test (1 per line).  It then attempts to crawl to the following URL through each target proxy:
* http://www.bishopfox.com/files/tools/googlediggity/other/Fhqwhgads.txt

If it receives a 200 OK within a 6 second timeout and the text 'everybody2daLim1t' is found on the returned page (showing that the proxy isn't posting a login prompt, error message, or altering the content), then it is considered a reliable open web proxy.

Strong Bad Emails: Everybody to the Limit - YouTube
* http://www.youtube.com/watch?v=s-WTbGupxbk

This is basically the same method that is used by the SearchDiggity tool to validate the GOOD/BAD reliability of a list of open web proxies to use.  For more info on SearchDiggity, see:
* http://www.bishopfox.com/resources/tools/google-hacking-diggity/attack-tools/#searchdiggity-v-3

Note: Testing of the script was used with ActiveState Perl:
* http://www.activestate.com/activeperl/downloads


## Usage
 ![ProxyListReliabilityCheck - Usage](https://github.com/BishopFox/ProxyListReliabilityCheck/blob/master/Screenshots/Usage-ProxyListReliabilityCheckv1.1.png)


## Example
See below example of script running against a list of open web proxies sent to us via our HideMyAss.com subscription.
 ![ProxyListReliabilityCheck - Example](https://github.com/BishopFox/ProxyListReliabilityCheck/blob/master/Screenshots/Example-ProxyListReliabilityCheckv1.1.png)


## Resource Links
Bishop Fox - Google Hacking Diggity Project:
* http://www.bishopfox.com/resources/tools/google-hacking-diggity/attack-tools/

Open Proxy Lists:
* http://www.hidemyass.com/proxy-list/
* http://www.publicproxyservers.com/
* http://www.google.com/search?q=+":8080" +":3128" +":80" filetype:txt
* http://www.dmoz.org/Computers/Internet/Proxying_and_Filtering/Hosted_Proxy_Services/Free/Proxy_Lists/

Other Proxy Checker Tools:
* http://www.edge-security.com/soft/proxyfinder-0.3.pl
* http://www.softsea.com/review/Proxy-Checker-Lite.html
