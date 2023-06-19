<!-- template form adicionar SoS -->

<?php require 'head.inc' ?>

<table  class="center">

    <tr><td>

	<form class="pure-form pure-form-stacked" action="add_soi.php">
    <fieldset>
        <legend><a href=index.php> Main </a> / <?php echo linkSoS($sos) . ' / ' . $msg ?> </legend>
		<input type=hidden name="oper" value="<?php echo $oper;?>">
		<input type=hidden name="id_soi" value="<?php echo $id_soi;?>">
		<input type=hidden name="id_sos" value="<?php echo $id_sos;?>">
		
		Name<br/>
        <input name="name" type="text" value="<?php echo $name; ?>"/>
		
		Constituent system<br/>		
		<select name="id_constituent">
		<?php
		
			foreach($cs as $c) {
				$ci=$c['id_constituent'];
				$cn=$c['name'];
				$sel = ($ci==$id_constituent) ? 'selected' : '';						
				
				echo "<option value='$ci' $sel>$cn</option>";
			}
		?>
		</select>
		
		Observation point<br/>
		<select name="id_observation_point">
		<?php
			foreach($obs as $o) {
				$oi=$o['id_observation_point'];
				$on=$o['name'];
				$ou=$o['unit'];
				$sel = ($oi==$id_observation_point) ? 'selected' : '';						
								
				echo "<option value='$oi' $sel>$on ($ou) </option>";
			}
		?>
		</select>
		
		Value<br/>
		<input type=text size=2 name='value' value=<?php echo $value;?> >
		
		<br/>
		
        <button type="submit" class="pure-button pure-button-primary">Save</button>
    </fieldset>
	</form>

    </td></tr>
	
</table>

<script 

<?php require 'tail.inc' ?>

