<?php

require 'conn.php';

$id_sos = isset($_REQUEST['id_sos']) ? $_REQUEST['id_sos'] : '';

// recupera parametros do sos
$sql = "select * from sos where id_sos = $id_sos ";
$result = $conn->query($sql);
$row = $result->fetch_assoc();

// parametros
$name = $row['name'];
$description = $row['description'];
$soskey = $row['soskey'];

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>ReViTa Tool</title>

<style>
<?php require('css/restyle.css'); ?>
</style>

    <!-- v= para evitar cache -->
    <link rel="stylesheet" href="css/pure-min.css"> 
    <!--<script type="text/javascript" src="diagram/js/jquery-3.6.0.min.js"></script>-->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>




</head>

<body style="font-family:sans-serif;">

<h2 class="head"> LabESC / PPGI </h2>

<table><tr><td>
    <a href=index.php> Main</a> / 
    <a href=show_sos.php?id_sos=<?php echo $id_sos; ?> > <?php echo $name; ?> </a> / Mission decomposition
<p/>

    <iframe src="diagram/index.php?id_sos=<?php echo $id_sos; ?>" height="800" width="1200" title="diagram"></iframe>

</td></tr></table>


    <script type="text/javascript" src="diagram/js/sweetalert.min.js"></script>

</body>

</html>
