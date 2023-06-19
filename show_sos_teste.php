<?php

require 'conn.php';
require 'util.php';

$id_sos= isset($_REQUEST['id_sos']) ? $_REQUEST['id_sos'] : 0;

$sos = getSoS($id_sos);

$constituents ="SELECT * FROM constituent WHERE id_sos = $id_sos";
$result_constituents = $conn->query($constituents);
$count_constituents = mysqli_num_rows($result_constituents);

$mission_requirements ="SELECT * FROM requirement WHERE id_sos = $id_sos";
$result_mission_requirements = $conn->query($mission_requirements);
$count_missions_requirements = mysqli_num_rows($result_mission_requirements);

$states_of_interest ="SELECT * FROM state_of_interest WHERE id_sos = $id_sos";
$result_states_of_interest = $conn->query($states_of_interest);
$count_states_of_interest = mysqli_num_rows($result_states_of_interest);


$observation_points ="SELECT * FROM observation_point WHERE id_sos = $id_sos";
$result_observation_points = $conn->query($observation_points);
$count_result_observation_points = mysqli_num_rows($result_observation_points);

$transients_configuration ="SELECT * FROM transient_configuration WHERE id_sos = $id_sos";
$result_transients_configuration = $conn->query($transients_configuration);
$count_transients_configuration = mysqli_num_rows($result_transients_configuration);


$composition_tac_soi =  "SELECT DISTINCT soi.id_soi as id_soi, soi.id_requirement as requirement, c.id_requirement, c.id_transient_configuration FROM constituent co, composition c,transient_configuration tac, state_of_interest soi,requirement r WHERE co.id_sos = $id_sos AND r.id_sos = $id_sos AND soi.id_requirement = r.id_requirement AND c.id_requirement = r.id_requirement AND soi.id_requirement = c.id_requirement AND c.id_transient_configuration = tac.id_transient_configuration AND tac.id_sos=$id_sos AND soi.id_sos = $id_sos ORDER BY soi.id_soi";
$result_composition_tac_soi = $conn->query($composition_tac_soi);
$count_composition_tac_soi = mysqli_num_rows($result_composition_tac_soi);

#TESTE_PARA_BD
#SELECT DISTINCT soi.id_soi as id_soi, soi.id_requirement as requirement, c.id_requirement, c.id_transient_configuration FROM constituent co, composition c,transient_configuration tac, state_of_interest soi,requirement r WHERE co.id_sos = 17 AND r.id_sos = 17 AND soi.id_requirement = r.id_requirement AND c.id_requirement = r.id_requirement AND soi.id_requirement = c.id_requirement AND c.id_transient_configuration = tac.id_transient_configuration AND tac.id_sos=17 AND soi.id_sos = 17 ORDER BY soi.id_soi


$soi_constituents = "SELECT DISTINCT soi.description as soi_description, cs.name as cs_name, op.description as op_description, r.description as mission_requirement, m.name as cs_mission FROM constituent cs, mission m, state_of_interest soi,requirement r, observation_point op, transient_configuration tac, composition c, tac.id_transient_configuration as soi_did_transient_configuration WHERE soi.id_requirement = r.id_requirement AND r.id_mission = m.id_mission AND m.id_constituent = cs.id_constituent AND soi.id_sos = $id_sos and op.id_sos = $id_sos AND op.id_soi = soi.id_soi AND tac.id_sos = $id_sos AND tac.id_transient_configuration = c.id_transient_configuration";
$result_soi_constituents = $conn->query($soi_constituents);
$count_soi_tac = mysqli_num_rows($result_soi_constituents);


require 'template/show_sos.tpl';

?>
