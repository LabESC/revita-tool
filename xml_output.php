<?php

header("Content-type: text/xml");

require 'conn.php';

$id_sos = $_REQUEST['id_sos'];

echo "<?xml version='1.0' encoding='UTF-8'?>";

//
echo "<sos id='$id_sos'>";

$sql="SELECT * FROM sos WHERE id_sos=".$id_sos;
$result = $conn->query($sql);
$row = $result->fetch_assoc();

echo '<name>'.$row['name'].'</name>';
echo '<description>'.$row['description'].'</description>';

printCS($id_sos);

echo '</sos>';

function printCS($id_sos) {
	
	global $conn;
	
	$sql="SELECT * FROM constituent WHERE id_sos=".$id_sos;
	$result = $conn->query($sql);
	while ($row = $result->fetch_assoc()) {
		echo '<constituent id="'.$row['id_constituent'].'">';
		echo '<name>'.$row['name'].'</name>';
		echo '<ip_address>'.$row['ip_address'].'</ip_address>'; 
		
		printMission($row['id_constituent']);
		
		echo '</constituent>';
	}	
}

function printMission($id_constituent) {
	
	global $conn;
	
	$sql="SELECT * FROM mission WHERE id_constituent=".$id_constituent;
	$result = $conn->query($sql);
	while ($row = $result->fetch_assoc()) {
		echo '<mission id="'.$row['id_mission'].'">';
		echo '<name>'.$row['name'].'</name>';
		echo '<description>'.$row['description'].'</description>'; 
		
		printRequirement($row['id_mission']);
		
		echo '</mission>';
	}	
}

function printRequirement($id_mission) {
	
	global $conn;
	
	$sql="SELECT * FROM requirement WHERE id_mission=".$id_mission;
	$result = $conn->query($sql);
	while ($row = $result->fetch_assoc()) {
		echo '<requirement id="'.$row['id_requirement'].'">';
		echo '<description>'.$row['description'].'</description>'; 
		
		printSoi($row['id_requirement']);
		
		echo '</requirement>';
	}	
}

function printSoi($id_requirement) {
	
	global $conn;
	
	$sql="SELECT * FROM state_of_interest WHERE id_requirement=".$id_requirement;
	$result = $conn->query($sql);
	while ($row = $result->fetch_assoc()) {
		echo '<state_of_interest id="'.$row['id_soi'].'">';
		echo '<description>'.$row['description'].'</description>'; 
		
		printObsPoint($row['id_soi']);
		
		echo '</state_of_interest>';
	}	
}

function printObsPoint($id_soi) {
	
	global $conn;
	
	$sql="SELECT * FROM observation_point WHERE id_soi=".$id_soi;
	$result = $conn->query($sql);
	while ($row = $result->fetch_assoc()) {
		echo '<observation_point id="'.$row['id_obspoint'].'">';
		echo '<description>'.$row['description'].'</description>'; 
		
		// fim da recursao
		
		echo '</observation_point>';
	}	
}


?>
