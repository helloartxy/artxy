<?php

require('database.php');

class Post{

    private $db = "";
    private $db_table = "user_post";
    private $result = array();
    private $sql = "";

    public function __construct(){
        $this->db = new Database();
    }

    // Adding new post
    public function newPost($data){
        return $this->db->insert("user_post",$data);
    }

// End of Inspire Class
}

?>