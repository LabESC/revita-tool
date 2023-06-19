<?php

include 'conn.php';

global $conn;

$id_soi = $_REQUEST['id_soi'];
$id_sos = $_REQUEST['id_sos'];
$desc = $_REQUEST['description'];

if(!empty($desc)){
	
$sql = "INSERT INTO observation_point (id_soi, id_sos, description) values
($id_soi, $id_sos, '$desc')";
		
$conn->query($sql);    

}else{
	$resultado_edicao = "You should fill description"	;
}

header("location:show_obspoints.php?id_sos=$id_sos");

?>