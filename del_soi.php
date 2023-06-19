<?php

include 'conn.php';

global $conn;

#print_r($conn);

$id_soi = $_REQUEST['id_soi'];
$id_sos = $_REQUEST['id_sos'];

#ANTES DE DELETAR DIZER PARA O USUÁRIO APAGAR A TAC	

$sql = "DELETE FROM state_of_interest WHERE id_soi= $id_soi "; #apagar estado de interesse
$sql2 = "DELETE FROM observation_point WHERE id_soi= $id_soi "; #apagar ponto de observação
#$sql3 = "DELETE FROM state_of_interest WHERE id_soi= $id_soi "; #apagar a tac
$conn->query($sql);    

#header("location:show_sois.php?id_sos=$id_sos")
echo "<script>location.href='show_sois.php?id_sos=$id_sos';</script>";

?>