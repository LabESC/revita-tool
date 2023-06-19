<?php

require 'conn.php';
require 'util.php';

$id_cs = 	isset($_REQUEST['id_cs']) ? $_REQUEST['id_cs'] : 0;

// seleciona o sos
$sql = "select * from constituent where id_constituent = $id_cs " ;
$result = $conn->query($sql);    
$row = $result->fetch_assoc();
$id_sos = $row['id_sos'];

// apaga
$sql = "delete from constituent where id_constituent = $id_cs " ;
$conn->query($sql);    

#header('Location: show_cs.php?id_sos='.$id_sos);
echo "<script>location.href='how_cs.php?id_sos='.$id_sos';</script>";

    
    