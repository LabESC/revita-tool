<?php

$servername = "localhost";
$username = "u260699983_mimamura";
$password = "378Equ#tor";
$database = "u260699983_sms";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

?>