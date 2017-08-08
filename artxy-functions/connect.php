<?php
include('class/database.php');
$db = new Database();
echo $db->db_num("SELECT * FROM artxy_user");
?>