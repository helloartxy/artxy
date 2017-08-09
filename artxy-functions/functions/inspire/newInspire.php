<?php

include('../../class/inspire.php');

$inspire = new Inspire();

if($_REQUEST){
    $date = date("Y-m-d H:i:s");
    $data = array(
        'post_title' => $_REQUEST['title'],
        'post_description' => $_REQUEST['description'],
        'post_date' => $date,
        'category_ID' => $_REQUEST['category_ID'],
        'sub_category_ID' => $_REQUEST['sub_category_ID']
    );

    var_dump($inspire->newInspire($data));
}

?>