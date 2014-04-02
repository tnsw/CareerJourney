<?php

class PSC_role_mdl extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }
    
    function get_Agency() {
        $sql = "SELECT * FROM Agency";
        $query = $this->db->query($sql);
        return $query->result();
    }   
       
    function get_Department() {
        $sql = "SELECT * FROM Department";
        $query = $this->db->query($sql);
        return $query->result();
    }   
        
    function get_Roles() {
        $sql = "SELECT * FROM Roles";
        $query = $this->db->query($sql);
        return $query->result();
    }   
        
    
}
