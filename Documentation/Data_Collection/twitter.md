#Our Utilization of the Tweepy API in gathering Tweets
---
---
##In order to gather tweets, we created a python program that incorporates the Tweepy API. We define keywords associated with each candidate, such as 'feelTheBern' and 'Trump 2016', that can be used to filter all of the tweets that our streams have access to. To seperate the tweets associated with each candidate, it became necessary for each candidate to have a seperate tweet stream. To do this, we utilitezed a Python threading library. Our implementation starts up a thread for each candidate, and each thread runs its own tweet stream. Upon recieving a tweet, each thread takes the tweet and stores it into the appropriate candidate's table in our Cassandra database.
