<?php

include 'conn.php';

global $conn;

$id_sos = $_REQUEST['id_sos'];
$id = $_REQUEST['id'];
$desc = $_REQUEST['desc'];
	
$sql = "UPDATE observation_point set description = '$desc'
	WHERE id_obspoint = $id ";
	
$conn->query($sql);    

header("location:show_obspoints.php?id_sos=$id_sos");

?>
