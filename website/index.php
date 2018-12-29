<?php
    if(isset($_POST['ASC'])) {
        $asc_sql = "SELECT sensors_length_data                
                    FROM tbl_sensors_data";
        $result = sortingQuery($asc_sql);
    } elseif(isset($_POST['DESC'])) {
        $desc_sql = "SELECT sensors_length_data                
                    FROM tbl_sensors_data DESC";
        $result = sortingQuery($desc_sql);
    } else
    if(isset($_POST['DEF'])) {
        $default_sql = "SELECT sensors_length_data                
                        FROM tbl_sensors_data";
        $result = sortingQuery($default_sql);
    } else {
        $default_sql = "SELECT sensors_length_data
                        FROM tbl_sensors_data ";
        $result = sortingQuery($default_sql);
    }

    function sortingQuery($sql) {
        include 'koneksi.php';
        $result = mysqli_query($koneksi,$sql);
        return $result;
    }
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="jQuery-3.1.1.min.js"></script>
        <script src="plotly.min.js"></script>
        <script src="bootstrap.min.js"></script>
        <link rel="stylesheet" href="bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <title>Pengukur Jarak</title>

        <!--<script type = "text/JavaScript">
            function AutoRefresh( t ) {
               setTimeout("location.reload(true);", t);
            }
        </script>-->
    </head>
    <body onload = "JavaScript:AutoRefresh(1000);">
    <div class="wrapper">
        <!--SIDE BAR-->
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <div class="i-am-centered">
                <h4>LOG DATA</h2><br>
                <?php
                    $data;
                    if(mysqli_num_rows($result) > 0){
                        while ($row = mysqli_fetch_assoc($result)){
                            $data = $row['sensors_length_data'];
                            echo $data;
                            echo '<br>';   
                        }
                    }
                ?>
                <!--<div id="logdata"></div>-->
            </div>
          </div>
        </nav>

        <!--PAGE CONTENT-->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-1000 pt-3 px-4">
            <div id="page-content-wrapper">
                <div class="judul">
                    <div class="i-am-centered"><h3>Grafik Pengukuran Jarak Berbasis Sinyal Ultrasonik<h3></div>
                </div>
                <div class="container-fluid">
                    <div class= "col-xs-12 col-sm-12 col-md-12">
                        <br><h5>Data pointer :</h5>
                        <div id="content"></div><br>
                        <form action="index.php" method="post">
                          <!--   <input type="submit" name="DEF" value="Normal">
                            <input type="submit" name="ASC" value="Ascending">
                            <input type="submit" name="DESC" value="Descending"> -->
                        </form>
                        <div id="chart"></div>
                    </div>
                </div>
            </div>
        </main>
            <script>
                $(document).each(function(){
                    loadData();
                })
                
                function loadData(){
                    $.get('data.php',function(data){
                        $('#content').html(data);
                    })
                }
                
                window.setInterval(loadData,1000);
            </script>

            <script>
                function getData(){
                    var isi = document.getElementById("content");
                    return parseInt(isi.innerText);
                }

                Plotly.plot('chart',[{
                    y:[getData()],
                    type:'line'
                }]);

                setInterval(function(){
                    Plotly.extendTraces('chart',{y:[[getData()]]},[0]);
                }, 1000);
            </script>
    </div>
    </body>
</html>