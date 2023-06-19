<?php

require 'show_errors.php';

// current channel
define("__BASEURL", "http://url_provider"); //add provider URL
$_baseURL = 'http://url_provider';


$local = array( '127.0.0.1' , '::1' );

// DB host select
if( in_array($_SERVER['REMOTE_ADDR'], $local)) {
  $servername = "localhost";
  $username = "root";
  $pwd = "root";
  $database = "db_name";
} else {
  $servername = "localhost";
  $username = "db_user";
  $pwd = "db_pass";
  $database = "db_name";
  
}

// Create connection
$conn = new mysqli($servername, $username, $pwd, $database);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

?>