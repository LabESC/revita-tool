<?php 

require 'head.inc'; 

require 'conn.php';
require 'util.php';

$id_sos= isset($_REQUEST['id_sos']) ? $_REQUEST['id_sos'] : 0;

$sos= getSoS( $id_sos );


if(isset($_GET['sois_error'])){
	$sois_error = $_GET['sois_error'];
	if($sois_error==1){
	?>
		<div class="alert alert-danger alert-custom alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		   <i class="fa fa-times-circle m-right-xs"></i> <strong>Oh snap!</strong> You should choose at least one <strong>States of Interest Violation</strong>.
		</div>
	<?php 
	} else{?>
		<div class="alert alert-danger alert-custom alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		   <i class="fa fa-times-circle m-right-xs"></i> <strong>Oh snap!</strong> Unexpected action. You should fill all shields.
		</div>
	<?php }
}

?>

<table class="center" > 
	<tr><td colspan=2> <a href=index.php>Main</a> / 
	<?php echo linkSoS($sos); ?>  / 
	<a href= 'define_invariant.php?id_sos=<?php echo $id_sos;?>'> Define invariant requirements </a> / 
	Create transient configurations <p/> </td></tr>

	<tr>
	<td>

	<form action='add_transient_configuration.php'>
	
	<table>
	<tr><td>

<?php
	
echo "<input type=hidden name='id_sos' value=$id_sos >";
		
echo "<b>Description</b> <input type=text size=30 required='required' name='description' >";
	
echo '<br/><br/><b>Composition</b><br/>';
	
// processa lista de requisitos
$reqsflex= getReqsFlex($id_sos);	
foreach($reqsflex as $rf) {

	if ( $rf[3]==1 ) {
		echo '<input type=text name="reqs[]"
			value="'.$rf[0].'" hidden>';
		echo '&nbsp;&nbsp;<input type=text value="'.$rf[1].'" readonly>';
	} else {
		$id_flex = $rf[0] + (100*100); // difereca flex
		echo "&nbsp;&nbsp;<select input name='reqs[]'>";
		echo "<option value= {$rf[0]}> {$rf[1]} </option>";
		echo "<option value= $id_flex > 
			{$rf[2]} (flex) </option>";
		echo '</select>';						
	}
		
	echo '<br/>';
}
	
echo '<br/><b>States of Interest violation</b> <br/>';
$soi = getStatesOfINterest($id_sos);
	
foreach ($soi as $s) {

	$soi_id_requirement = $s[2];
	$soi_description = '<span class=text-danger>'.$s[1].'</span>';
	#constituinte o qual o estado de interesse faz referência
	$sql_constituent = "SELECT c.name as constituent_name, c.description, m.name as constituent_mission, r.description as mission_requirement FROM state_of_interest soi, requirement r, mission m, constituent c WHERE soi.id_requirement = r.id_requirement and r.id_mission = m.id_mission and m.id_constituent = c.id_constituent and soi.id_requirement = $soi_id_requirement and soi.id_sos = $id_sos";									
	$result_soi_constituent = $conn->query($sql_constituent);
	$row_constituent = mysqli_fetch_assoc($result_soi_constituent);
	$constituent_name = $row_constituent['constituent_name'];
	$constituent_name = '<a class=text-info>'.$constituent_name.'</a>';
	$constituent_mission = $row_constituent['constituent_mission'];
	
	echo "&nbsp;&nbsp;<input type='checkbox' name='sois[]' 
		value={$s[0]}> {$constituent_name} {$soi_description} ({$constituent_mission})<br/>";
}
			
echo '<br/>';
			
?>
	
	</td></tr>
	</table>
	
	<button>Add transient configuration</button>
	<button type=button onclick='history.back();'>Cancel</button>
	</form>	
	
	</td>	
	</tr>
	
</table>

<?php

function getReqsFlex( $id_sos ) {

	global $conn;
	
	$sql = "SELECT a.id_mission, 
		b.description, b.flexibilization, b.id_requirement, b.invariant
		FROM mission a, requirement b
		WHERE a.id_sos=$id_sos and a.id_mission=b.id_mission";

	$result = $conn->query($sql);	
	
	// envia resposta
	$reqsflex=array();
	while ( $row = $result->fetch_assoc() ) {	

		$reqsflex[]= array(
			$row['id_requirement'],
			$row['description'], 
			$row['flexibilization'],
			$row['invariant'] ); 		
	}

	return $reqsflex;
}

function getStatesOfInterest($id_sos) {

	global $conn;
	
	$sql = "SELECT *
		FROM state_of_interest
		WHERE id_sos= $id_sos";

	$result = $conn->query($sql);	
	
	// envia resposta
	$s=array();
	while ( $row = $result->fetch_assoc() ) {	
		$s[] = array($row['id_soi'], $row['description'], $row['id_requirement']);
	}

	return $s;
}

require 'tail.inc';

?>
