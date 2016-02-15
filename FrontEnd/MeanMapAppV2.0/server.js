// Dependencies
// -----------------------------------------------------
var express         = require('express');
var mongoose        = require('mongoose');
var port            = process.env.PORT || 3000;
var database        = require('./app/config');
var morgan          = require('morgan');
var bodyParser      = require('body-parser');
var methodOverride  = require('method-override');
var assert 	    = require('assert');
var app             = express();

// Express Configuration
// -----------------------------------------------------
// Sets the connection to MongoDB
mongoose.connect(database.localtest.url);

// Logging and Parsing
app.use(express.static(__dirname + '/public'));                 // sets the static files location to public
app.use('/bower_components',  express.static(__dirname + '/bower_components')); // Use BowerComponents
app.use(morgan('dev'));                                         // log with Morgan
app.use(bodyParser.json());                                     // parse application/json
app.use(bodyParser.urlencoded({extended: true}));               // parse application/x-www-form-urlencoded
app.use(bodyParser.text());                                     // allows bodyParser to look at raw text
app.use(bodyParser.json({ type: 'application/vnd.api+json'}));  // parse application/vnd.api+json as json
app.use(methodOverride());

// Routes
// ------------------------------------------------------
require('./app/routes.js')(app);

//casandra connection

var cassandra = require('cassandra-driver');
var client = new cassandra.Client({ contactPoints: ['128.138.202.110', '128.138.202.117'], keyspace: 'candidates'});
var query = 'SELECT * FROM trump';
client.execute(query, ['tweet_text'], function(err, result) {
  assert.ifError(err);
  var resultLength = result.rows.length;
  console.log(resultLength);
  for (var i = 0; i < resultLength; i++) {
     console.log(result.rows[i].tweet_text);
  } 
});

// Listen
// -------------------------------------------------------
app.listen(port);
console.log('App listening on port ' + port);
