<?php
include 'koneksi.php';

$sql = "SELECT sensors_length_data               
        FROM tbl_sensors_data";
$result = mysqli_query($koneksi,$sql);
$data;

    while ($row = mysqli_fetch_assoc($result)){
        $data=$row['sensors_length_data'];
        
    }
   echo $data;

?>