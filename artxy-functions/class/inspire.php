<?php
// this should be extended from post class
require('database.php');

class Inspire{

    private $db = "";
    private $db_table = "user_post";
    private $result = array();
    private $sql = "";

    public function __construct(){
        $this->db = new Database();
    }

    // Adding new Inspire posts
    public function newInspire($data){
        return $this->db->insert("user_post",$data);
    }

// End of Inspire Class
}

?>