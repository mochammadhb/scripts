<!DOCTYPE html>
<html lang="en" >
<head>
<meta charset="UTF-8">
<title>List of all IP Address</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300'>
<body>
<div class="container">
  <h2>List of all IPv4 address&nbsp;&nbsp;&nbsp;<span style="font-weight: normal; font-size: 0.5em;">[<a href="../README.md.html">Tutorial</a>]</span></h2>
  <hr/>
  <p>You can see registration date and expiration date of each user below&nbsp:</p>            
  <table class="table table-hover">
    <thead>
      <tr class="info">
        <th>IP Address</th>
	<th>Registration Date</th>
        <th>Expiration Date</th>
	<th>Status</th>
      </tr>
    </thead>
    <tbody>
<?php
include '../../config.php';
$fetchqry = "SELECT * FROM `expiration` WHERE expirationdate >= CURRENT_DATE()";
$result=mysqli_query($con,$fetchqry);
$num=mysqli_num_rows($result);
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) { ?>
	<tr>
        <td><?php echo $row['ipaddress'];?></td>
        <td><?php echo $date1 = $row['registerdate'];?></td>
	<td><?php echo $date2 = $row['expirationdate'];?></td>
	<td><?php echo 'Active';?></td>
</tr>
<?php 
} 
?>
    </tbody>
  </table>
</div>
</body>
</html>