<?php

include 'conn.php';

global $conn;

$id_sos = $_REQUEST['id_sos'];
$id = $_REQUEST['id_requirement'];
$invariant = $_REQUEST['invariant'];
$flex = $_REQUEST['flex'];

if ($invariant==1) $flex='';
	
$sql = "UPDATE requirement set invariant = $invariant,
	flexibilization = '$flex'
	WHERE id_requirement = $id ";

$conn->query($sql);    

header("location:define_invariant.php?id_sos=$id_sos");

?>
