<?php

include 'conn.php';

global $conn;

$id_sos = $_REQUEST['id_sos'];
$id = $_REQUEST['id'];
$desc = $_REQUEST['desc'];
	
$sql = "UPDATE state_of_interest set description = '$desc'
	WHERE id_soi = $id ";
	
$conn->query($sql);    

header("location:show_sois.php?id_sos=$id_sos");

?>