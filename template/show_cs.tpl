<?php require 'head.inc'; ?>

<table class="center"> <tr><td> <a href=index.php>Main</a> / <?php echo linkSoS($sos); ?>   / Constituent systems <p/> </td></tr>

	<tr><td><b>Constituent system</b></td><td><b>Mission</b></td><td></td></tr>
	
<?php

    echo '<pre>';
    print_r($cs);

	foreach( $cs as $c) {
		echo '<tr><td>' . linkCS($c) . '</td><td>';
		
		foreach($c['mission'] as $m) {
		    echo $m['name'].'<br/>';
	    }
	   
	    echo '</td><td></td></tr>';
	}
?>	
	
	<tr><td colspan=3>
	<a class="pure-button pure-button-primary" 
	    href="add_cs.php?id_sos=<?php echo $id_sos; ?>&id_constituent=0">Add constituent system</a>
	</td></tr></table>

    <p/>
    </td>    
    </tr>
</table>

<script>
function myConfirm() {
  return confirm("Are you sure?");
}
</script>

<?php 

require 'tail.inc';

// retorna parametros do SoI
function linkCS( $cs ) {

    $del = " <a class='pure-button pure-button-primary' href=del_cs.php?id_cs=" . $cs['id_constituent'] .
        " onclick='return myConfirm()'>Del</a>";

    $link  = "<a class='pure-button' href=add_cs.php?id_constituent="
        . $cs['id_constituent'] . '&id_sos=' . $cs['id_sos']
        . " title= '" .$cs['description']. "'> ".$cs['name']."</a>";

    $link .= $cs['original'] ? '' : $del;

	return $link;
}

?>
