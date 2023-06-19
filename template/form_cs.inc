<!-- template form adicionar cs -->

<?php 

require 'head.inc';

// cs original nao edita nome
$ro = $original ? ' readonly ' : ''; 

?>

<table  class="center">

    <tr><td>

	<form class="pure-form pure-form-stacked" action="add_cs.php">
    <fieldset>
	
        <legend><a href=index.php> Main </a> / 
		<?php echo linkSoS($sos) . ' / ' . 
		'<a href="show_cs.php?id_sos='.$id_sos.'">Constituent systems</a> / ' . $msg ?> 
		</legend>
		
		<input type=hidden name="oper" value="<?php echo $oper;?>">
		<input type=hidden name="id_constituent" value="<?php echo $id_constituent;?>">
		<input type=hidden name="id_sos" value="<?php echo $id_sos;?>">
		
		Name<br/>
        <input name="name" type="text" value="<?php echo $name; ?>" <?php echo $ro; ?> />

		Description<br/>
        <input name="description" type="text" value="<?php echo $description; ?>"/>

		IP address<br/>
        <input name="ip_address" type="text" value="<?php echo $ip_address; ?>"/>

		<br/>
		
        <button type="submit" class="pure-button pure-button-primary">Save</button>
    </fieldset>
	</form>

    </td></tr>
	
</table>

<?php require 'tail.inc' ?>

