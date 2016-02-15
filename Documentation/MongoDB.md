# Creating the Collection

$ mongo
> use DATABASENAME
> db.createCollection(Tweets, { name: <string>
                              autoIndexId: <boolean>,
                              number: <number>,
                              dateStart: <number>,
                              dateEnd: <number> })
