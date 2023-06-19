<?php

require 'conn.php';
require 'util.php';

// save/update enviado? + patrametros
$oper = isset($_REQUEST['oper']) ? $_REQUEST['oper'] : '';
$id_sos = isset($_REQUEST['id_sos']) ? $_REQUEST['id_sos'] : 0;
$id_constituent = isset($_REQUEST['id_constituent']) ? $_REQUEST['id_constituent'] : 0;

// atrib sos
$sos= getSoS( $id_sos );
if ($id_constituent>0) $cs = getOneCS($id_constituent);

// processa form submit 

if ( $oper=='insert' ) {

	$name= $_REQUEST['name'];
	$description= $_REQUEST['description'];
	$ip_address = $_REQUEST['ip_address'];

    // grava
    $sql = "INSERT INTO constituent (id_sos, name,description,ip_address, original)
		VALUES ( $id_sos,
		    '$name' , 
		    '$description', 
		    '$ip_address', 
		    0 )" ;
    $conn->query($sql);  

    header('Location: show_cs.php?id_sos='.$id_sos);
	
} elseif ( $oper=='update' ) {

	$name= $_REQUEST['name'];
	$description= $_REQUEST['description'];
	$ip_address = $_REQUEST['ip_address'];

    // grava
    $sql = "UPDATE constituent SET 
        name = '$name', 
        description= '$description',
		ip_address = '$ip_address' 
		WHERE id_constituent = $id_constituent " ;
    $conn->query($sql);    
	
    header('Location: show_cs.php?id_sos='.$id_sos);
}

// inicializa variaveis do cs 
if ($id_constituent > 0) {
	$oper='update';
	$name=$cs['name'];
	$description=$cs['description'];
	$ip_address=$cs['ip_address'];
	$original=$cs['original'];
	$msg= 'Update constituent system';
} else {
	$oper='insert';
	$name='';
	$description='';
	$ip_address='';
	$original=0;
	$msg= 'Add constituent system';
}

// chama formulario
require 'template/form_cs.tpl'; 

?>

