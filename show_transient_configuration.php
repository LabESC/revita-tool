<?php

require 'conn.php';
require 'util.php';

$id_sos= isset($_REQUEST['id_sos']) ? $_REQUEST['id_sos'] : 0;

$sos= getSoS( $id_sos );

$transient_configuration = getTransientConfiguration($id_sos);

require 'template/show_transient_configuration.tpl';

// retorna todos os soi do sos
function getTransientConfiguration($id_sos) {
		
	global $conn;
	
	$sql = "SELECT * FROM transient_configuration
		WHERE id_sos=$id_sos";

	$result = $conn->query($sql);

	// envia resposta
	$transconf=array();
	while ($row = $result->fetch_assoc() ) {	
		$transconf[]= $row;
	}
	
	return $transconf;
}

?>