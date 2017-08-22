<?php

include '../class/database.php';
$dbOut = new Database();

$data = $dbOut->select('category', 'ID, category_name', null ,null, null, null);
// $query = "SELECT ID, sub_category_name FROM sub_category WHERE category_ID='3'";
// $dbOut->sql($query);
$data = $dbOut->getResult();
header('Content-Type: application/json');
echo(json_encode($data));

?>