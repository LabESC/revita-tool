<!-- template form adicionar/atualizar SoS -->

<?php require 'head.inc' ?>

<?php 

if (isset($resultado_edicao)){

?>

 <div class="alert alert-warning alert-custom alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	<i class="fa fa-exclamation-circle m-right-xs"></i> <strong>Warning!</strong> <?php echo $resultado_edicao;?>.
 </div>

<?php 
}

?>

<table  class="center">

    <tr><td>

	<form class="pure-form pure-form-stacked" action="add_sos.php">
    <fieldset>
        <legend><a href=index.php> Main </a> / <?php echo $msg ?> </legend>
		<input type=hidden name="oper" value="<?php echo $oper;?>">
		<input type=hidden name="id_sos" value="<?php echo $id_sos;?>">
		
		Name<br/>
        <input name="name" type="text" value="<?php echo $name; ?>"/>
		Description<br/>
        <textarea name="description" class="pure-input-1-3" rows="5"><?php echo $description;?></textarea>
        <button type="submit" class="pure-button pure-button-primary">Save</button>
        <a class='pure-button' href='index.php'>Cancel</a>
        
    </fieldset>
	</form>

    </td></tr>
	
</table>

<?php echo $del_cmd; ?>

<?php require 'tail.inc' ?>
