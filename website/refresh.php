<?php
$ch = curl_init();



curl_setopt($ch, CURLOPT_URL, 'http://127.0.0.1/ultrasonic_reading/data.php');

curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

$output = curl_exec($ch);
$data = (int)$output;

echo (integer)$output;

curl_close($ch);