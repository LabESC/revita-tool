
<?php require 'head.inc'; ?>

<table class="center">
<tr><td>
        
    <a href=index.php>Main</a> / <?php echo linkSoS($sos); ?> / State-of-interest
    <p/>

    <table style="width:600px;">
    <th>State-of-interest</th><th>CS</th><th>Obs Point</th>

<?php 

    // tabela de soi
    foreach($soi as $s) {

		echo '<tr>';
		echo '<td><a class="pure-button pure-button" 
			href="add_soi.php?id_sos='.$id_sos.'&'.'id_soi='. $s['id_soi'] .'">' . $s['name'] . '</a></td>';
		echo '<td><p class="display">'. $s['cname'] . '</td>';
		
		$obs = $s['oname'] . ' ' . $s['value'] . ' ' . $s['unit'] ;
		echo '<td><p class="display">'. $obs . '</td>';
		echo '</tr>';		
	}
	
?>

    <tr><td colspan=3>
    <a class="pure-button pure-button-primary" href="add_soi.php?id_sos='.$id_sos,'&id_soi=0">Add State-of-interest</a>
    </td></tr>
    </table>

    <p/>

</td>    
</tr>
    
</table>

<?php require 'tail.inc'; ?>