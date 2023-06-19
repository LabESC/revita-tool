<?php

include 'conn.php';

global $conn;

#print_r($conn);

$id_requirement = $_REQUEST['id_requirement'];
$id_sos = $_REQUEST['id_sos'];
	
$sql = "DELETE FROM requirement WHERE id_requirement= $id_requirement ";
$result_del = $conn->query($sql);
#header("location:show_requirements.php?id_sos=$id_sos");

echo "<script>location.href='show_requirements.php?id_sos=$id_sos';</script>";

?>