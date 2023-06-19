<?php

// div de edicao

// aplicavel aos requirements
$invariant='';

// divType declarado no chamador

switch ($div_type) {
   case 'requirement':
		$action = 'update_requirement.php';
		$invariant = '<br/>Invariant? &nbsp;
		<input type="radio" name="invariant" value="1" checked> Yes
		<input type="radio" name="invariant" value="0"> No';
		break;
   case 'soi':
		$action = 'update_soi.php';
		break;
   case 'obspoint':
		$action = 'update_obspoint.php';
		break;
}

?>

<div id='editDiv' hidden
	style=" 
	border: 2px solid;  
	padding: 20px;
	background: white;
	position: fixed;
	left: 40%;
	top: 50%;
	transform: translate(-50%, -50%);"
>
	<form action='<?php echo $action; ?>'>
	<input type='hidden' name='id_sos' value=<?php echo $sos['id_sos']; ?> >
	<input type='hidden' name='id' id='id'>
	<textarea cols=30 name='desc' id='desc'></textarea>
	<br/><br/>
	<button> Update </button>
	<button type='button' onclick='hideEdit();'> Cancel </button>	
	</form>
</div>

<script>

function showEdit(desc,id) {
	document.getElementById('editDiv').style.top = event.clientY;
	document.getElementById('id').value = id;		
	document.getElementById('desc').value = desc;
	document.getElementById('editDiv').hidden = false;
}

function hideEdit() {
	document.getElementById('editDiv').hidden = true;
}

</script>
