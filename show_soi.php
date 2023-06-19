<?php

require 'conn.php';
require 'util.php';

$id_sos= isset($_REQUEST['id_sos']) ? $_REQUEST['id_sos'] : 0;

$sos= getSoS( $id_sos );
$soi= getAllSoi( $id_sos );

require 'template/show_soi.tpl';

?>
