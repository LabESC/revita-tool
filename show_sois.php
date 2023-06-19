<?php

require 'conn.php';
require 'util.php';

$id_sos= isset($_REQUEST['id_sos']) ? $_REQUEST['id_sos'] : 0;

$sos= getSoS( $id_sos );

$missions= getMissions( $id_sos );

require 'template/show_sois.tpl';


// retorna todos os soi do sos
function getMIssions($id_sos) {
		
	global $conn;
	
	$sql = "SELECT c.name csname, a.id_mission id_mission, id_requirement, 
		a.name as miname, b.description description
		FROM mission a, requirement b, constituent c
		WHERE a.id_sos=$id_sos AND a.id_mission=b.id_mission AND a.id_constituent=c.id_constituent
		ORDER BY miname";
	
	$conn->query($sql);    

	$result = $conn->query($sql);

	// envia resposta
	$req=array();
	while ($row = $result->fetch_assoc() ) {
	
		$req[]= $row;
	}
	
	return $req;
}

?>
