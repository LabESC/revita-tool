<?php

require 'conn.php';
require 'util.php';

$id_sos= isset($_REQUEST['id_sos']) ? $_REQUEST['id_sos'] : 0;

if($id_sos){

$sos= getSoS( $id_sos );

$sois= getSois( $id_sos );

require 'template/show_obspoints.tpl';
} else{
	echo "<script>location.href='index.php';</script>";
}

// retorna todos os soi do sos
function getSois($id_sos) {
		
	global $conn;
	
	$sql = "SELECT a.id_requirement id_requirement, id_soi, 
		a.description as reqdesc, b.description description
		FROM requirement a, state_of_interest b
		WHERE a.id_sos=$id_sos and a.id_requirement=b.id_requirement
		ORDER BY reqdesc";

	$conn->query($sql);    

	$result = $conn->query($sql);

	// envia resposta
	$soi=array();
	while ($row = $result->fetch_assoc() ) {
	
		$soi[]= $row;
	}
	
	return $soi;
}

?>
