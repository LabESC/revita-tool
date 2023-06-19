<?php

if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') {
    #header('Location: http://mimamura.com/revitasos');
    header('Location: http://julianafernandes.pro.br/revita-tool/');
}

// header html no-cache
header("Cache-Control: no-cache, no-store, must-revalidate"); // HTTP 1.1.
header("Pragma: no-cache"); // HTTP 1.0.
header("Expires: 0"); // Proxies.

// URL base
$_baseurl = "http://";   
$_baseurl.= $_SERVER['HTTP_HOST'];   
$_baseurl.= $_SERVER['REQUEST_URI'];    
  
require 'conn.php';
require 'show_errors.php';

require 'head.inc';

?>

<div class="row">
						<div class="col-sm-12">
							<div class="page-title">
								ReViTa 
							</div>
							<div class="page-sub-header">
								<strong>Re</strong>liability <strong>vi</strong>a <strong>t</strong>ransient configurations <hr/>
							</div>
						</div>
						
					</div>

<div class="row">
						<div class="col-lg-12">
						
							<div class="smart-widget">
								<div class="smart-widget-header">
									Systems-of-Systems Overview
									<div class="smart-widget-body clearfix">
										<a href="add_sos.php" class="btn btn-success btn-sm pull-right"><i class="fa fa-plus"></i> Add SoS</a>
									</div>
								</div>

								<div class="smart-widget-inner table-responsive">
									
									<div class="smart-widget-hidden-section">
										<ul class="widget-color-list clearfix">
											<li style="background-color:#20232b;" data-color="widget-dark"></li>
											<li style="background-color:#4c5f70;" data-color="widget-dark-blue"></li>
											<li style="background-color:#23b7e5;" data-color="widget-blue"></li>
											<li style="background-color:#2baab1;" data-color="widget-green"></li>
											<li style="background-color:#edbc6c;" data-color="widget-yellow"></li>
											<li style="background-color:#fbc852;" data-color="widget-orange"></li>
											<li style="background-color:#e36159;" data-color="widget-red"></li>
											<li style="background-color:#7266ba;" data-color="widget-purple"></li>
											<li style="background-color:#f5f5f5;" data-color="widget-light-grey"></li>
											<li style="background-color:#fff;" data-color="reset"></li>
										</ul>
									</div>

									<table class="table table-striped no-margin">
										<thead>
											<tr>
												<th>SoS</th>
												<th>Description</th>
												<th># Constituent Systems</th>
												<th># TAC</th>
												<th> </th>
											</tr>
										</thead>
										<tbody>
										<?php
											// lista de SoS gravados no banco
										
											$sql_sos = "SELECT * FROM sos ";
											
											$result = $conn->query($sql_sos);

											if ($result->num_rows > 0) {
											  // output data of each row
											#Total of SoS: $count=mysqli_num_rows($result );
											  while($row_sos = $result->fetch_assoc()) {													  	 
													$constituents ="SELECT * FROM constituent WHERE id_sos = $row_sos[id_sos]";
													$result_constituents = $conn->query($constituents);
													$count_constituents = mysqli_num_rows($result_constituents);

													$transients_configuration ="SELECT * FROM transient_configuration WHERE id_sos = $row_sos[id_sos]";
													#echo $transients_configuration;
													$result_transients_configuration = $conn->query($transients_configuration);
													$count_transients_configuration = mysqli_num_rows($result_transients_configuration);
												?>
											<tr>
												<td>
													<?php
													if($count_transients_configuration < 1){?>
														<i class="fa fa-exclamation-triangle fa-solid text-danger" data-toggle="tooltip" data-placement="top" title="&#9888; Warning! No associated transient architectural configurations.">

													<?php 
													}else{
													?>
													<i class="fa fa-star fa-lg text-warning" data-toggle="tooltip" data-placement="top" title="This SoS has <?php echo $count_transients_configuration; ?> TAC(s).">

													<?php }

													?>
												</i>
												<a href="show_sos.php?id_sos=<?php echo $row_sos['id_sos']?>"><strong class="font-md"><?php echo $row_sos['name']?></strong></a>
													<!--<span class="label label-success m-left-xs">status aqui (Ver com Francisco)</span>-->

													<!--<td><i class="fa fa-star fa-lg text-warning" data-toggle="tooltip" data-placement="top" title="Prioridade Alta" data-original-title="Tooltip on top"></i>&nbsp; <a href="#"><strong class="font-md">SRC-RPPN.00002-5/2018</strong></a>
												<span class="label label-info m-left-xs">status aqui</span></td> -->

												</td>
												<td><?php echo $row_sos['description']?></td>
												<td><?php echo $count_constituents;?></td>
												<td><?php echo $count_transients_configuration;?></td>
												<td><a href="add_sos.php?id_sos=<?php echo $row_sos['id_sos']?>" title="descrição do SoS aqui" class="btn btn-success btn-sm pull-right"><i class="fa fa-edit"></i> Edit SoS</a></td>
												
											</tr>

										<?php	} 
										}
										else {
											  echo "<tr><td cols=4>0 results</td></tr>";
											}
  
										?>


										</tbody>
									</table>
								</div><!-- ./smart-widget-inner -->
							</div><!-- ./smart-widget -->
						</div><!-- ./col -->
					</div><!-- ./row -->


<?php require 'tail.inc'; ?>
