<?php

include 'conn.php';

global $conn;

$id_requirement = $_REQUEST['id_requirement'];
$id_sos = $_REQUEST['id_sos'];
$desc = $_REQUEST['description'];
	
$sql = "INSERT INTO state_of_interest (id_requirement, id_sos, description) values
($id_requirement, $id_sos, '$desc')";
	
$conn->query($sql);    

header("location:show_sois.php?id_sos=$id_sos");

?>