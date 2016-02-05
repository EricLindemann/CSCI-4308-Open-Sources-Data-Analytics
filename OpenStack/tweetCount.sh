#!/bin/bash

#PATH=/sbin:/bin:/usr/sbin:/usr/bin:/home/centos/CSCI-4308-Open-Sources-Data-Analytics/OpenStack
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/home/centos/CSCI-4308-Open-Sources-Data-Analytics/OpenStack:/home/centos/dse-4.8.1/bin:/home/centos/spark-1.5.1-bin-hadoop2.6
HOME=/

cd /home/centos/CSCI-4308-Open-Sources-Data-Analytics/OpenStack


password=$(python hash.py)
#c=$(ps aux | grep trump.py | wc | cut -d ' ' -f 7)
#if [ $c -eq 1 ]
#then
#        sudo sh -c "/home/centos/spark-1.5.1-bin-hadoop2.6/bin/pyspark --packages com.datastax.spark:spark-cassandra-connector_2.11:1.5.0-M2 --packages TargetHolding:pyspark-cassandra:0.1.5 /home/centos/spark-1.5.1-bin-hadoop2.6/trump.py"
#fi


#tweetcount=$(echo "USE junk; select count(*) from trump;" | /home/centos/dse-4.8.1/bin/cqlsh 128.138.202.117 | tail -n 3 | head -n 1 | cut -d ' ' -f 2)

tweetcount=$(cat /home/centos/spark-1.5.1-bin-hadoop2.6/trumpTweetCount.txt)
totalTweetCount=$(cat /home/centos/CSCI-4308-Open-Sources-Data-Analytics/totalTweetCount.txt)
trumpTweetCount=$(cat /home/centos/CSCI-4308-Open-Sources-Data-Analytics/trumpTweetCount.txt)
sandersTweetCount=$(cat /home/centos/CSCI-4308-Open-Sources-Data-Analytics/sandersTweetCount.txt)
bushTweetCount=$(cat /home/centos/CSCI-4308-Open-Sources-Data-Analytics/bushTweetCount.txt)
clintonTweetCount=$(cat /home/centos/CSCI-4308-Open-Sources-Data-Analytics/clintonTweetCount.txt)
rubioTweetCount=$(cat /home/centos/CSCI-4308-Open-Sources-Data-Analytics/rubioTweetCount.txt)
carsonTweetCount=$(cat /home/centos/CSCI-4308-Open-Sources-Data-Analytics/carsonTweetCount.txt)



#b=$"\#Total Tweets: $totalTweetCount \n\nNumber of Trump Tweets: $tweetcount"


#sudo sh -c "echo $b > tweetCount.md"
sudo sh -c "printf \"#Total Number of Tweets: $totalTweetCount \n---\n---\n#Number of Trump Tweets: $trumpTweetCount\n#Number of Sanders Tweets: $sandersTweetCount\n#Number of Bush Tweets: $bushTweetCount\n#Number of Clinton Tweets: $clintonTweetCount\n#Number of Rubio Tweets: $rubioTweetCount\n#Number of Carson Tweets: $carsonTweetCount\" > sortedNumbers.txt" 

sudo sh -c 'cat sortedNumbers.txt | sort -nrk5 > sortedNumbers.md'


#sudo sh -c "printf \"#Total Tweets: $totalTweetCount \n---\n#Number of Trump Tweets: $trumpTweetCount\n#Number of Sanders Tweets: $sandersTweetCount\n#Number of Bush Tweets: $bushTweetCount\n#Number of Clinton Tweets: $clintonTweetCount\n#Number of Rubio Tweets: $rubioTweetCount\n#Number of Carson Tweets: $carsonTweetCount\" > tweetCount.md"


sudo git add sortedNumbers.md &> /dev/null
sudo git commit -m "Updated candidate tweet count" &> /dev/null
sudo git push https://CommandoScorch16:dogworm16@github.com/phugiadang/CSCI-4308-Open-Sources-Data-Analytics
#git config credential.helper store
#git push &> /dev/null
#"Username for 'https://github.com': "
#expect -exact "Username for 'https://github.com': "
#send "commandoscorch16"
#expect "Password for 'https://commandoscorch16@github.com': "


#/usr/bin/expect -c 'expect "Password for 'https://commandoscorch16@github.com': " {git push &> /dev/null;send $password}'

#send "$password"
