<?php

// funcoes utilitarias

// salva log
function saveLog($msg, $type='') {
	global $conn;

    // nome do chamador
    $php = __FILE__;	
    $php = substr($php, strpos($php,'public_html')+11);
    
	$sql = "insert into log (msg,php,type) values ('$msg','$php', 'type') ";
	$conn->query($sql);
}

// zera log
function deleteLog() {
	global $conn;
	
	$sql = "delete from log";
	$conn->query($sql);
}

// zera config
function deleteConfiguration($id_sos, $id_transient_config=0) {
	global $conn;
	
	$sql = "delete from configuration where id_sos=$id_sos and id_transient_config = $id_transient_config";
	$conn->query($sql);
}


/* PUTS parecem duplicado em save_sos **** constituent mission e configuration em 24/03


// *** PUT function ***

// atualiza ou insere constituinte
function putConstituent( $id_sos, $hash, $name, $desc ) {

	global $conn;

	$sql = "select count(*) cnt from constituent 
	    where id_sos=$id_sos and hash = '$hash' ";
	
	$result = $conn->query($sql);
    $row = $result->fetch_assoc();  
    
    if ( $row['cnt'] == 0 ) {   // ainda nao existe
    
        $sql = "insert into constituent (id_sos,hash,name, description)
            values ($id_sos, '$hash', '$name', $desc) ";
        $conn->query($sql);
        
    } else {    // ja existe
    
        $sql = "update constituent 
            set name='$name', description = '$desc'
            where id_sos=$id_sos and hash='$hash' ";
        $conn->query($sql);
    }

}

// atualiza ou insere missaonte
function putMission( $id_sos, $hash, $name ) {

	global $conn;

	$sql = "select count(*) cnt from mission 
	    where id_sos=$id_sos and hash = '$hash' ";

	$result = $conn->query($sql);
    $row = $result->fetch_assoc();  
    
    saveLog('put mission '.$name. $row['cnt']);

    if ( $row['cnt'] == 0 ) {   // ainda nao existe
    
        $sql = "insert into mission (id_sos,hash,name)
            values ($id_sos, '$hash', '$name') ";
        saveLog($sql);
        $conn->query($sql);

    } else {    // ja existe
    
        $sql = "update mission 
            set name='$name' 
            where id_sos=$id_sos and hash='$hash' ";
        $conn->query($sql);
    }
}

/
// atualiza ou insere missaonte
function putConfiguration( $id_sos, $hash_from, $hash_to ) {

	global $conn;

    // id do cs
	$sql = "select * from constituent 
	    where hash = '$hash_from' ";
	$result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $id_from = $row['id_constituent'];
   
    // id da mission
	$sql = "select * from mission
	    where hash = '$hash_to' ";
	$result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $id_to = $row['id_mission'];

    // apaga ligacoes anteriores
	// $sql = "insert into configuration (id_sos, id_transient_config, id_constituent, id_mission) 
	//    values ( $id_sos, 0, $id_from, $id_to)";
		
	$sql = "update mission set id_constituent=$id_from where id_mission=$id_to";
		
	$conn->query($sql);
}

************** 
*/


/* **** GET functions **** */

function getIdSos( $soskey ) {

	global $conn;

	$sql = "select * from sos where soskey='$soskey' ";
	$conn->query($sql);    

	$result = $conn->query($sql);
    $row = $result->fetch_assoc();  

	// envia resposta
	return $row['id_sos'];
}

// retorna parametros do SoS
function getSoS( $id ) {

	global $conn;

	$sql = "select * from sos where id_sos=$id";
	$conn->query($sql);    

	$result = $conn->query($sql);

	// envia resposta
	$row = $result->fetch_assoc();

	return array( 'id_sos'=>$id, 
	            'name'=>$row['name'], 
	            'description'=>$row['description'],
	            'soskey' => $row['soskey']);		
}

// retorna os constituintes
function getOneCS( $id ) {
    
	global $conn;

	$sql = "SELECT * from constituent WHERE id_constituent=$id";
	$conn->query($sql);    

	$result = $conn->query($sql);
	$row = $result->fetch_assoc();
	
	$cs = array('id_constituent'=>$row['id_constituent'], 'name'=>$row['name'],
		'description'=>$row['description'], 
		'ip_address'=>$row['ip_address'],
		'original'=>$row['original'],
		'id_sos'=>$row['id_sos']);	
		
	return $cs;
}

// retorna parametros do SoI
function getObsPoint() {
	
	global $conn;
	
	$sql = "SELECT * from observation_point";
	$conn->query($sql);    

	$result = $conn->query($sql);

	// envia resposta
	$obs = array();
	while ($row = $result->fetch_assoc() ) {
		$obs[]= array('id_observation_point'=>$row['id_observation_point'], 
			'name'=>$row['name'], 'unit'=>$row['unit'], 'description'=>$row['description']);		
	}

	return $obs;
}

// retorna missao do cs
function getMissionByConstituent( $idcs ) {
	
	global $conn;
	
	// seleciona id da missao
	$sql = "SELECT * from configuration
	    WHERE id_constituent = $idcs and id_transient_config = 0";

	$ret = array();   
	$result = $conn->query($sql);
	
	while ($row = $result->fetch_assoc() ) { 
	    
        $idm = $row['id_mission'];

        saveLog($idm);

        // atributos da missao
	    $sql = "SELECT * from mission
    	    WHERE id_mission=$idm ";
    	    
    	$result2 = $conn->query($sql);
    	$row2 = $result2->fetch_assoc();
	
        $ret[] = array(
            'id_mission' => $row['id_mission'],
            'hash' => $row2['hash'],
            'name' => $row2['name'],
            'description' => $row2['description'] 
            );
	}
	
	return $ret;
}


/* **** List functions **** */

// retorna parametros do SoI
function listSoI( $id ) {
	
	global $conn;
	
	$sql = "SELECT id_soi, a.name sname, b.name cname, c.name oname, unit, value   
	    FROM state_of_interest a, constituent b, observation_point c
	    WHERE a.id_constituent=b.id_constituent 
	    AND a.id_observation_point=c.id_observation_point 
	    AND b.id_sos=$id";
	    
	$result = $conn->query($sql);
	
	$s=array();
	while ($row = $result->fetch_assoc() ) {
	    $s[]= array('id_soi'=>$row['id_soi'], 'name'=>$row['sname'].' ('. 
	        $row['cname'].', '.$row['oname'].' '.$row['value'].' '.$row['unit'].')' );

	}
	
	return $s;
}

// retorna parametros do SoI
function listCS( $id ) {
	
	global $conn;
	
	$sql = "SELECT * FROM constituent WHERE id_sos=$id";
	    
	$result = $conn->query($sql);
	
	$s=array();
	while ($row = $result->fetch_assoc() ) {
	    $s[]= array('id_constituent'=>$row['id_constituent'], 
	    'name'=>$row['name'],
	    'original'=>$row['original'],
	    'mission'=>$row['mission']);
	}
	
	return $s;
}



/* **** Limk functions **** */

// retorna parametros do SoI
function linkSoS( $sos, $button=false ) {
	
	// link com botao
	$b = ($button) ? ' class="pure-button pure-button" ' : '';
	
	$link = '<a '.$b. 'href=show_sos.php?id_sos='.$sos['id_sos'].' title="'. $sos['description'] .
	'">' . $sos['name'] . '</a>';

	return $link;
}

// retorna parametros do SoI
function linkSoI( $sos, $button=false ) {

	// link com botao
	$b = ($button) ? ' class="pure-button pure-button" ' : '';
	
	$link = '<a '.$b . 'href=show_soi.php?id_sos='.$sos['id_sos'].' title= "'.$sos['description'] .
		'">State-of-interest</a>';

	return $link;
}



// formatacao dos comandos json na fila
function prettyPrint( $json )
{
    $result = '';
    $level = 0;
    $in_quotes = false;
    $in_escape = false;
    $ends_line_level = NULL;
    $json_length = strlen( $json );

    for( $i = 0; $i < $json_length; $i++ ) {
        $char = $json[$i];
        $new_line_level = NULL;
        $post = "";
        if( $ends_line_level !== NULL ) {
            $new_line_level = $ends_line_level;
            $ends_line_level = NULL;
        }
        if ( $in_escape ) {
            $in_escape = false;
        } else if( $char === '"' ) {
            $in_quotes = !$in_quotes;
        } else if( ! $in_quotes ) {
            switch( $char ) {
                case '}': case ']':
                    $level--;
                    $ends_line_level = NULL;
                    $new_line_level = $level;
                    break;

                case '{': case '[':
                    $level++;
                case ',':
                    $ends_line_level = $level;
                    break;

                case ':':
                    $post = " ";
                    break;

                case " ": case "\t": case "\n": case "\r":
                    $char = "";
                    $ends_line_level = $new_line_level;
                    $new_line_level = NULL;
                    break;
            }
        } else if ( $char === '\\' ) {
            $in_escape = true;
        }
        if( $new_line_level !== NULL ) {
            $result .= "\n".str_repeat( "\t", $new_line_level );
        }
        $result .= $char.$post;
    }

    return $result;
}

?>