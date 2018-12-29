<?php
    include 'koneksi.php';
    if(isset($_POST['ASC'])) {
        $sql = "SELECT sensors_length_data
                FROM tbl_sensors_data";
    }elseif(isset($_POST['DESC'])) {
        $sql=  "SELECT sensors_length_data                
                FROM tbl_sensors_data DESC";
    }

    $result = mysqli_query($koneksi,$sql);
    $data;
    
        while ($row = mysqli_fetch_assoc($result)){
            $data = $row['sensors_length_data'];
            echo $data;
            echo '<br>';   
        }
    
    
?>

<!--
if(isset($_POST['ASC'])) {
    $asc_sql = "SELECT * FROM table_reading ORDER BY reading";
    $result = sortingQuery($asc_sql);
} elseif(isset($_POST['DESC'])) {
    $desc_sql = "SELECT * FROM table_reading WHERE ORDER BY reading DESC";
    $result = sortingQuery($desc_sql);
}

function sortingQuery($sql){
    $data;
    if(mysqli_num_rows($result) > 0){
        while ($row = mysqli_fetch_assoc($result)){
            $data = $row['reading'];
            echo $data;
            echo '<br>';   
        }
    }
}
-->