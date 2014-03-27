<?php

class Capability_group extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }
    
    var $name;
    
    function insert_capability_group($name) {
        $this->name = $name;
        $this->db->insert('capability_group', $this);
    }
    
    function update_capability_group($id,$name) {
        $this->name = $name;
        $this->db->update('capability_group', $this, array('id' => $id));
    }
    
    function delete_capability_group($id) {
        $this->db->delete('capability_group', array('id' => $id));
    }
    
    function get_capability_groups() {
        $query = $this->db->get('capability_group');
        return $query->result();
    }
     
    function get_capability_group($id) {
        $sql = "SELECT * FROM capability_group WHERE id = ?";
        $query = $this->db->query($sql, array($id));
        return $query->result();
    }   
    
}