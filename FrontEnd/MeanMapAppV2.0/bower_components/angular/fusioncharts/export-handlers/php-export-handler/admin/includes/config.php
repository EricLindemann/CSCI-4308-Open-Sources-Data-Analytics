<?php

date_default_timezone_set('Asia/Kolkata');
$host = "localhost" ;
$user = "exportserveruser";
$pass = "IQ8Lw5UlZE7b";
$db = "exportserverdb";
$con = mysql_connect($host,$user,$pass);
if (!$con)
{
  die('Could not connect: ' . mysql_error());
}
$db_selected = mysql_select_db($db, $con);
if (!$db_selected) {
    die ('Can\'t use '. $db . mysql_error());
}
