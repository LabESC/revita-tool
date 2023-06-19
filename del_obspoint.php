<?php

include 'conn.php';

global $conn;

#print_r($conn);

$id_obspoint = $_REQUEST['id_obspoint'];
$id_sos = $_REQUEST['id_sos'];
	
$sql = "DELETE FROM observation_point WHERE id_obspoint= $id_obspoint ";
$conn->query($sql);    

#header("location:show_obspoints.php?id_sos=$id_sos")
echo "<script>location.href='show_obspoints.php?id_sos=$id_sos';</script>";


?>