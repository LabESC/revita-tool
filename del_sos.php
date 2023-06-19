<?php

include 'conn.php';

global $conn;

$id_sos = $_REQUEST['id_sos'];
	
$sql = "DELETE FROM sos WHERE id_sos= $id_sos ";
$conn->query($sql);    

$sql = "DELETE FROM network WHERE id_sos= $id_sos ";
$conn->query($sql); 

$sql = "DELETE FROM network_cmd WHERE id_sos= $id_sos ";
$conn->query($sql); 

$sql = "DELETE FROM mission WHERE id_sos= $id_sos ";
$conn->query($sql); 

$sql = "DELETE FROM constituent WHERE id_sos= $id_sos ";
$conn->query($sql); 

$sql = "DELETE FROM requirement WHERE id_sos= $id_sos ";
$conn->query($sql); 

$sql = "DELETE FROM state_of_interest WHERE id_sos= $id_sos ";
$conn->query($sql); 

$sql = "DELETE FROM observation_point WHERE id_sos= $id_sos ";
$conn->query($sql); 

#header("location:index.php");
echo "<script>location.href='index.php';</script>";
?>