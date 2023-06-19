<?php

require 'conn.php';
require 'util.php';

if(isset($_REQUEST['sois'])){


$id_sos = $_REQUEST['id_sos'];
$desc = $_REQUEST['description'];
$reqs= $_REQUEST['reqs'];
$sois= $_REQUEST['sois'];


// guarda serializado
$violation = implode(',',$sois);

// cs afetados
$cs=array();
foreach($sois as $s) {
	$c = getCSbySoi($s);
	if ( array_search($c,$cs) === false )
		$cs[] = getCSbySoi($s);
}
$affected_cs = implode(', ',$cs);

$soskey = md5(time());

$sql = "insert into transient_configuration (soskey, id_sos, description, violation, affected_cs) values ( '$soskey', $id_sos, '$desc', '$violation', '$affected_cs' )";

//echo $sql;
//echo "<br>";
//echo $soskey;

$conn->query($sql);

$id_transient_configuration = getIdTransientConfiguration( $soskey );

// insere a composicao

foreach($reqs as $r) {	
	

	// flexibilizado? id somando 10.000 no form
	$flex=0;
	if ( $r > (100*100) ) {
		$flex = 1;
		$r = $r - (100*100);
	}

	$sql = "INSERT INTO composition
	( id_transient_configuration, id_requirement, flexibilized) 
	VALUES 
	( $id_transient_configuration, $r, $flex)";
	#echo $sql."<br/>";
	
	$conn->query($sql);	
	//echo "Salvou composição";
		
}

// transient confif + 100*100 p/ diferenciar do id_SoS
$id_tc100 = $id_transient_configuration + (100*100); 
#. converter tudo para string ->$id_sos, $affected_cs

#echo $id_tc100 ;
#echo "<hr>";

$script = getScript($id_sos, $affected_cs);

#echo $script;
#echo "<hr>";
#echo "vai gravar netwrok<br>";
// cria a network e network_cmd para o SoS
$sql = "insert into network (id_sos, soskey, script) values ($id_tc100, '$soskey', '$script' )" ;
$conn->query($sql);    
$sql = "insert into network_cmd (id_sos, soskey) values ($id_tc100, '$soskey')" ;
$conn->query($sql);   

#header("location:show_transient_configuration.php?id_sos=$id_sos");
echo "<script>location.href='show_transient_configuration.php?id_sos=$id_sos';</script>";


}else{
	$id_sos = $_REQUEST['id_sos'];
	echo "<script>location.href='new_transient_configuration.php?id_sos=$id_sos&sois_error=1';</script>";
	#new_transient_configuration.php?id_sos=1
}

function getCSbySoi($id_soi) {
		
	global $conn;
	
	$sql = "SELECT a.id_constituent, a.hash hash, 
		a.name csname
		FROM constituent a, mission b, requirement c, state_of_interest d 
		WHERE a.id_constituent= b.id_constituent
		AND b.id_mission=c.id_mission 
		AND c.id_requirement=d.id_requirement
		AND d.id_soi=$id_soi";
	
	$conn->query($sql);    

	$result = $conn->query($sql);

	// envia resposta
	$req=array();
	$row = $result->fetch_assoc();
	$csname= $row['csname'];
	
	return $csname;
}

function getScript($id_sos, $affected_cs) {

	global $conn;
	
	$sql = "SELECT * FROM network WHERE id_sos=$id_sos";
	
	$conn->query($sql);    

	$result = $conn->query($sql);
	$row = $result->fetch_assoc();

	$script = explode(';',$row['script']);
		
	// retira consti -> mission
	$output = '';
	$max_x = 0;
	$max_y = 0;
	foreach ($script as $s) {
		
		// exclui cs e indiv mission
		if ( (strpos($s,'addConstituent') === false) AND
			(strpos($s,'linkIndividualMission') === false) ) {
				$output .= $s .';' ;
			} else {
				$parts = explode(',',$s);
				$max_x = (intval($max_x)  > intval($parts[2])+0) ? intval($max_x)  : intval($parts[2])+0;
				$max_y = (intval($max_y)  > intval($parts[3])+0) ? intval($max_y)  : intval($parts[3])+0;				
			}				
	}
	
	// mensagem de clone
	if (! empty($affected_cs) ) {
		$affected_cs = 'Affected CS due state of interest violations are: ' . $affected_cs;
	}
	
	$output .= 't1=addMessage("*** ATTENTION *** Cloned from original diagram. ' . $affected_cs . ' (you can delete this message)", "", ' . $max_x . ',' . $max_y . ', "xxx");';

	return $output;
	
}


//configuração transiente
function getIdTransientConfiguration( $soskey ) {

	global $conn;

	$sql = "select * from transient_configuration where soskey='$soskey' ";
	$conn->query($sql);    

	$result = $conn->query($sql);
    $row = $result->fetch_assoc();  

	// envia resposta
	return $row['id_transient_configuration'];
}

/*

n1=addConstituent("( )","undefined",177,-70,"lcmg5d99");
n2=addConstituent("( )","undefined",-42,-66,"lcmg5ebp");
n3=addConstituent("( )","undefined",531,-77,"lcmg6ad8");
n4=addMission("Realizar notificação","Mission tooltip - id: 4",-39,-240,"lcmg6l7g");
n5=addMission("Informar autonomia das baterias","Mission tooltip - id: 5",180,-152,"lcmg7ci4");
n6=addMission("Informar nível de combustível","Mission tooltip - id: 6",414,-150,"lcmg7yp0");
n7=addRefinement("undefined","undefined",288,-200,"");
n8=addMission("Calcular autonomia total","Mission tooltip - id: 8",286,-242,"lcmg8shh");
n9=addRefinement("undefined","undefined",286,-320,"");
n10=addMission("Notificar plantonistas sobre interrupção e tempo total de autonomia","Mission tooltip - id: 10",287,-388,"lcmg9zvg");n11=addMission("Identificar interrupção de energia","Mission tooltip - id: 11",599,-241,"lcmgbgpf");
e12=linkRefinement(n5,n7,"","");
e13=linkRefinement(n6,n7,"","");
e14=linkRefinement(n7,n8,"","");
e15=linkIndividualMission(n2,n4,"","");
e16=linkIndividualMission(n1,n5,"","");
e17=linkIndividualMission(n3,n6,"","");
e18=linkRefinement(n4,n9,"","");
e19=linkRefinement(n8,n9,"","");
e20=linkMission(n9,n10,"","");
e21=linkIndividualMission(n3,n11,"","");e22=linkRefinement(n11,n9,"","");
t1=addMessage("*** ATTENTION *** Affected CS due state of interest violations: Gateway telefonia, Gerador, No-break", "", 100, 100, "xxx");
*/






?>