<?php

require 'conn.php';
require 'util.php';

// save/update enviado?
$oper = 	isset($_REQUEST['oper']) ? $_REQUEST['oper'] : '';
$id_sos = 	isset($_REQUEST['id_sos']) ? $_REQUEST['id_sos'] : 0;

if ( $oper=='insert' ) {

	$name= $_REQUEST['name'];
	$description= $_REQUEST['description'];

    $soskey = md5(time());

    if(!empty($name) and !empty($description)){

    // grava
    $sql = "insert into sos (soskey,name,description) 
		values ('$soskey', '$name' , '$description' )" ;
		
    $conn->query($sql);    
    
	$id_sos = getIdSos( $soskey );
	
	// cria a network e network_cmd para o SoS
    $sql = "insert into network (id_sos, soskey) values ($id_sos, '$soskey')" ;
    $conn->query($sql);    

    $sql = "insert into network_cmd (id_sos, soskey) values ($id_sos, '$soskey')" ;
    $conn->query($sql);    
	
    header('Location: index.php');
	}else{
		$resultado_edicao = "You should fill all fields"	;
	}

} elseif ( $oper=='update' ) {

	$name= $_REQUEST['name'];
	$description= $_REQUEST['description'];
	if(!empty($name) and !empty($description)){
	    // grava
	    $sql = "update sos set name = '$name', 
			description= '$description' 	
			where id_sos = '$id_sos'" ;
			
	    $conn->query($sql);    
	    header('Location: index.php');
	}else{
		$resultado_edicao = "You should fill all fields"	;
	}
}

// inicializa variaveis do form
if ($id_sos > 0) {
	$oper='update';
	$sos= getSoS( $id_sos );
	$name=$sos['name'];
	$description=$sos['description'];
	$msg= 'Update SoS';	
	$del_cmd = '&nbsp;&nbsp;<a class="pure-button" href=del_sos.php?id_sos='.$id_sos .
		' onclick="return confirm(\'This will delete all related elements.\n Are you sure?\')" ' .
		'>Delete SoS</a><p/>';	
} else {
	$oper='insert';
	$name='';
	$description='';
	$msg= 'Add SoS';
	$del_cmd='';
}

require 'template/form_sos.tpl'; 

?>

