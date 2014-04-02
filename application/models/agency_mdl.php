<?php

class Agency_mdl extends CI_Model {
    
        function __construct()
    {
        parent::__construct();
    }
    
    var $name;
    
    function insert_agency_group($name) {
        $this->name = $name;
        $this->db->insert('agency', $this);
    }
    
    function update_agency_group($id,$name) {
        $this->name = $name;
        $this->db->update('agency', $this, array('id' => $id));
    }
    
    function delete_agency_group($id) {
        $this->db->delete('agency', array('id' => $id));
    }
    
    function get_agency_groups() {
        $query = $this->db->get('agency');
        return $query->result();
    }
     
    function get_agency_group($id) {
        $sql = "SELECT * FROM agency WHERE id = ?";
        $query = $this->db->query($sql, array($id));
        return $query->result();
    }   
       
    
}
