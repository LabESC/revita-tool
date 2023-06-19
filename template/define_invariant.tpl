<?php require 'head.inc'; ?>

<table class="center" > 
	<tr><td colspan=2> <a href=index.php>Main</a> / <?php echo linkSoS($sos); ?>  / Mission requirements for TAC <p/> </td></tr>

	<tr>
	<td><b>Constituent system</b></td>
	<td><b>Requirement(s)</b></td>
	</tr>
	
<?php

	// cor das linhas
	$bgcolor="#eee";
	
	foreach( $cs as $c) {
		
		$bgcolor = ($bgcolor=='#eee') ? "#ccc" : "#eee";
		echo "<tr bgcolor='$bgcolor' >";
		
		echo '<td>&#10003;<strong>' . $c['csname']. '</strong><br/><i>Mission description: ' . $c['miname'] . '</i> </td>';
		
		echo '<td>'; 
					
		$reqs = getRequirements($c['id_mission']);
		
		if ( count($reqs) == 0 ) {
			echo '<font color=red>No requirement(s) defined</font>';			
		}
		
		foreach ($reqs as $r) {
			
			$txt=$r['description'];
			$jstxt = '"'.preg_replace('~\R~','\r\n',$r['description'] ).'"';					
				
			echo $txt . '<br/>';	
				
			$id_requirement= $r['id_requirement'];			

			// invariant e flexibilization
			echo '<br/>';
			if  ($r['invariant']) {
				echo 'Is this an invariant requirement? Yes';
			} else {
				echo 'Is this an invariant requirement? No <br/>';
				echo 'Relaxed requirement: ' . 
					$r['flexibilization'];
			}

			// esta proxima div
			$div = "'div$id_requirement'";
			
			echo '&nbsp;&nbsp;&nbsp;
			<button class="btn btn-sm btn-info" onclick="showDiv('.$div.');"> Edit </button>';					
					
			$inv0= $r['invariant']==0 ? ' checked' : '';	
			$inv1= $r['invariant']==1 ? ' checked' : '';
					
			echo '<br/>';		
					
			echo "<div id='div$id_requirement' hidden
				style='border:1px solid gray;
				margin:10px; padding:10px;'>
				<form action=update_invariant.php>		
				<input type=hidden name=id_requirement 
				value=$id_requirement >
				<input type=hidden name=id_sos value={$sos['id_sos']}> 					
				Invariant? &nbsp;&nbsp; 
				<input type='radio' name='invariant' value=1 $inv1 onchange='handleChange(this);' > Yes
				<input type='radio' name='invariant' value=0 $inv0 onchange='handleChange(this);' > No
				<br/>
				<label id='labflex'>Flexibilization</label>
<textarea cols=30 name='flex' id='flex'>{$r['flexibilization']}</textarea>
				<button class='btn btn-sm btn-success'> Update </button>
				</form>
				</div><hr/>" ;
		}
				
		echo '</td>'; 

	    echo '</tr>'		;
	}
	
	/**echo "<tr>
		<td></td>
		<td>
		<font size=+2>
		<a class='pure-button' href='show_transient_configuration.php?id_sos={$sos['id_sos']}'>
		Next: create transient configurations</a>
		</font>
		</td>
		</tr>";**/
	
?>	
	
</table>

<script>

// mostra div de edicao
function showDiv( div ) {
	element = document.getElementById( div );
	element.removeAttribute("hidden");	
}

</script>
  
<?php 

// requisitos da missao
function getRequirements($id_mission) {
	global $conn;
	
	$sql = "SELECT * from requirement where id_mission=$id_mission ";
	$conn->query($sql);    

	$result = $conn->query($sql);

	// envia resposta
	$req=array();
	
	while ($row = $result->fetch_assoc() ) {

		$req[]= $row;
	}
	
	return $req;
}

require 'tail.inc';

?>
