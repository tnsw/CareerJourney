<?php

class PSC_mdl extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }
    
    var $name;
    
    function insert_psc_group($name) {
        $this->name = $name;
        $this->db->insert('PSC_Cap_Group', $this);
    }
    
    function update_psc_group($id,$name) {
        $this->name = $name;
        $this->db->update('PSC_Cap_Group', $this, array('id' => $id));
    }
    
    function delete_psc_group($id) {
        $this->db->delete('PSC_Cap_Group', array('id' => $id));
    }
    
    function get_psc_groups() {
        $query = $this->db->get('PSC_Cap_Group');
        return $query->result();
    }
     
    function get_psc_group($id) {
        $sql = "SELECT * FROM PSC_Cap_Group WHERE id = ?";
        $query = $this->db->query($sql, array($id));
        return $query->result();
    }   
       
    
}

