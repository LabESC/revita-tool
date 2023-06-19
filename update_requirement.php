<?php

include 'conn.php';

global $conn;

$id_sos = $_REQUEST['id_sos'];
$id = $_REQUEST['id'];
$desc = $_REQUEST['desc'];
	
$sql = "UPDATE requirement set description = '$desc'
	WHERE id_requirement = $id ";
	
$conn->query($sql);    

header("location:show_requirements.php?id_sos=$id_sos");

?>
