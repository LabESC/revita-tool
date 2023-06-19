<?php

include 'conn.php';

global $conn;

$id_transient_configuration = $_REQUEST['id_transient_configuration'];

$id_sos = $_REQUEST['id_sos'];
	
$sql = "DELETE FROM transient_configuration WHERE id_transient_configuration = $id_transient_configuration ";

$conn->query($sql);   

$sql = "DELETE FROM composition WHERE id_transient_configuration = $id_transient_configuration ";

$conn->query($sql);   

$id_tc =  $id_transient_configuration + (100*100);
$sql = "DELETE FROM network WHERE id_transient_configuration = $id_tc ";

$conn->query($sql);   
 
header("location:show_transient_configuration.php?id_sos=$id_sos")

?>