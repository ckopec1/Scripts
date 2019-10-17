#!/bin/bash
touch outfile.txt
chmod 777 outfile.txt

# set variables
ip1="$(nslookup hostname1.com | grep 'Address: ')"
ip2="$(nslookup hostname2.com | grep 'Address: ')"
ip3="$(nslookup hostname3.com | grep 'Address: ')"
ip4="$(nslookup hostname4.com | grep 'Address: ')"
ip5="$(nslookup hostname5.com | grep 'Address: ')"
ip6="$(nslookup hostname6.com | grep 'Address: ')"
ip7="$(nslookup hostname7.com | grep 'Address: ')"

echo "Running nslookup DR Script"

#Generate email to send
echo "Subject: Current IP lookup" > outfile.txt
echo "Content-Type: text/html; charset=us-ascii" >> outfile.txt

echo "<html>" >> outfile.txt
echo "<h1> Output: </h1>" >> outfile.txt

echo "Checking hostname1.com..."
if [[ $ip1 = "Address: 199.168.0.0" ]]
then
        echo "<b>hostname1.com</b> is in <font color="green"> RIVERWOODS </font>- $ip1 <br></br>" >> outfile.txt
else
        echo "<b>hostname1.com</b> is in <font color="red">NEW ALBANY</font> - $ip1<br></br>" >> outfile.txt
fi

echo "Checking hostname2.com..."
if [[ $ip2 = "Address: 199.168.0.1" ]]
then
        echo "<b>hostname2.com</b> is in <font color="green"> RIVERWOODS </font> - $ip2 <br></br>" >> outfile.txt
else
        echo "<b>hostname2.com</b> &nbsp &nbsp &nbsp is in <font color="red"> NEW ALBANY </font> - $ip2 <br></br>" >> outfile.txt
fi

echo "Checking hostname3.com..."
if [[ $ip3 = "Address: 199.168.0.2" ]]
then
        echo "<b>hostname3.com</b> <p style="padding-right: 16px;">is in <font color="green"> RIVERWOODS </font> - $ip3 </p> <br></br>" >> outfile.txt
else
        echo "<b>hostname3.com/b> <p style="padding-right: 16px;">is in <font color="red"> NEW ALBANY </font> - $ip3 </p> <br></br>" >> outfile.txt
fi

echo "Checking hostname4.com..."
if [[ $ip4 = "Address: 199.168.0.3" ]]
then
        echo "<b>hostname4.com</b> &nbsp &nbsp is in <font color="green"> RIVERWOODS </font> - $ip4<br></br>" >> outfile.txt
else
        echo "<b>hostname4.com</b> &nbsp &nbsp is in <font color="red"> NEW ALBANY </font> - $ip4 <br></br>" >> outfile.txt
fi

echo "Checking hostname5.com..."
if [[ $ip5 = "Address: 199.168.0.4" ]]
then
        echo "<b>hostname5.com</b> &nbsp &nbsp is in <font color="green"> RIVERWOODS </font> - $ip5<br></br>" >> outfile.txt
else
        echo "<b>hostname5.com</b> &nbsp &nbsp is in <font color="red"> NEW ALBANY </font> - $ip5 <br></br>" >> outfile.txt
fi

echo "Checking hostname6.com..."
if [[ $ip6 = "Address: 199.168.0.5" ]]
then
        echo "<b>hostname6.com</b> is syncing FROM <font color="green"> RIVERWOODS </font> - $ip6<br></br>" >> outfile.txt
else
        echo "<b>hostname6.com</b> is FROM <font color="red"> NEW ALBANY </font> - $ip6 <br></br>" >> outfile.txt
fi

echo "Checking hostname7.com..."
if [[ $ip7 = "Address: 6" ]]
then
        echo "<b>hostname7.com</b> is syncing FROM <font color="green"> RIVERWOODS </font> - $ip7<br></br>" >> outfile.txt
else
        echo "<b>hostname7.com</b> is FROM <font color="red"> NEW ALBANY </font> - $ip7 <br></br>" >> outfile.txt
fi

echo "</html>" >> outfile.txt

echo ""
sendmail chriskopec@discover.com < outfile.txt
echo "Mail sent..."

rm outfile.txt
