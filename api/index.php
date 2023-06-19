<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require __DIR__ . '/../../vendor/autoload.php';

$app = new \Slim\Slim();

$app->config(array(
    'debug' => true
));

// $app = new \Slim\Slim(array( 'debug' => true));

$app->get('/', function () {
    require('help.php');
});



$app->get('/getNSoS/:id', function ($id) {
    
    require '../conn.php';

    try {
        $sql="select * from sos where id_sos=$id ";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        echo json_encode($row);
    } catch (Exception $e) {
        echo $e->errorMessage();
    }
    
});




$app->get('/getNodes/:soskey', function ($soskey) {
    
    require '../conn.php';

    try {
         $sql="select nodes from network where soskey = '$soskey' ";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        echo $row["nodes"];
    } catch (Exception $e) {
        echo $e->errorMessage();
    }
    
});

$app->get('/getEdges/:soskey', function ($soskey) {
    
    require '../conn.php';

    try {
        $sql="select edges from network where soskey = '$soskey' ";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        echo $row["edges"];
    } catch (Exception $e) {
        echo $e->errorMessage();
    }
    
});

$app->get('/getSoS/:soskey', function ($soskey) {
    
    require '../conn.php';

    try {
        $sql="select script from network where soskey = '$soskey' ";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        echo $row["script"];
    } catch (Exception $e) {
        echo $e->errorMessage();
    }
    
});

$app->get('/setBackground/:id/:color/:soskey', function ($id, $color, $soskey) {
    
    $_c = array(
        'id' => $id+0,
        'cmd' => 'setBackground',
        'bgcolor' => $color
    );
    
    queueCommand( $_c, $soskey );

});

$app->get('/setTooltip/:id/:text/:soskey', function ($id, $text, $soskey) {

    $_c = array(
        'id' => $id+0,          
        'cmd' => 'setTooltip',
        'tooltip' => $text
    );
    
    queueCommand( $_c, $soskey);
    
});

$app->get('/setLabel/:id/:text/:soskey', function ($id, $text, $soskey) {

   $_c = array(
        'id' => $id+0,          
        'cmd' => 'setLabel',
        'label' => $text
    );
    queueCommand( $_c, $soskey );

});

$app->get('/setPriority/:id/:text/:soskey', function ($id, $text, $soskey) {

    $_c = array(
        'id' => $id+0,          
        'cmd' => 'setPriority',
        'priority' => $text
    );
    queueCommand( $_c, $soskey );

});

$app->get('/setIpAddress/:id/:text/:soskey', function ($id, $text, $soskey) {

    $_c = array(
        'id' => $id+0,          
        'cmd' => 'setIpAddress',
        'ipAddress' => $text
    );
    queueCommand( $_c, $soskey );
    
});
    
$app->get('/setResponseTime/:id/:text/:soskey', function ($id, $text, $soskey) {
    
    $_c = array(
        'id' => $id+0,          
        'cmd' => 'setResponseTime',
        'responseTime' => $text
    );
    queueCommand( $_c, $soskey );
    
});

$app->get('/setAvailability/:id/:text/:soskey', function ($id, $text, $soskey) {

    $_c = array(
        'id' => $id+0,          
        'cmd' => 'setAvailability',
        'availability' => $text
    );
    queueCommand( $_c, $soskey );

});

$app->get('/sendMessage/:text/:type/:soskey', function ($text, $type, $soskey) {

    $_c = array(
        'cmd' => 'sendMessage',
        'msg' => $text,
        'msg_type' => $type
    );
    queueCommand( $_c, $soskey );

});

$app->run();

// grava na fila para processamento
function queueCommand( $_c, $soskey) {

    require 'conn.php' ;

    $_c_json = json_encode($_c);
    $sql = "insert into network_cmd (cmd, soskey) values ('$_c_json', '$soskey') ";
    
    try {
        $conn->query($sql);
        echo "$_c_json for $soskey queued";
    } catch (Exception $e) {
        echo $e->errorMessage();
    }
}

// ******************************

// https://mimamura.com/revitasos/api/getNSpS/1


?>