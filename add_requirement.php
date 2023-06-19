<?php

include 'conn.php';

global $conn;

$id_mission = $_REQUEST['id_mission'];
$id_sos = $_REQUEST['id_sos'];
$desc = $_REQUEST['description'];
	
$sql = "INSERT INTO requirement (id_mission, id_sos, description) values
($id_mission, $id_sos, '$desc')";
	
$conn->query($sql);    

header("location:show_requirements.php?id_sos=$id_sos");

?>