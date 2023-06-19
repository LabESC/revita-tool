<?php

require 'conn.php';
require 'util.php';

$id_sos= isset($_REQUEST['id_sos']) ? $_REQUEST['id_sos'] : 0;

$sos= getSoS( $id_sos );

$cs = getCS( $id_sos );

require 'template/show_requirements.tpl';

// retorna todos os soi do sos
function getCS($id_sos) {
		
	global $conn;
	
	$sql = "SELECT a.id_constituent id_constituent, id_mission, 
		a.name as csname, b.name miname
		FROM constituent a, mission b
		WHERE a.id_sos=$id_sos and a.id_constituent=b.id_constituent
		ORDER BY csname";

	$conn->query($sql);    

	$result = $conn->query($sql);

	// envia resposta
	$cs=array();
	while ($row = $result->fetch_assoc() ) {
	
		$cs[]= $row;
	}
	
	return $cs;
}

?>