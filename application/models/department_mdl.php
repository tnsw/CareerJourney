<?php

class Department_mdl extends CI_Model {
    
        function __construct()
    {
        parent::__construct();
    }
       
    function insert_department_group($name, $agency_id) {
        $this->name = $name;
        $this->agency_id = $agency_id;
        $this->db->insert('department', $this, array('id' => $id));
    }
    
    function update_department_group($id,$name,$agency_id) {
        $this->name = $name;
        $this->agency_id = $agency_id;
        $this->db->update('department', $this, array('id' => $id));
    }
    
    function delete_department_group($id) {
        $this->db->delete('department', array('id' => $id));
    }
    
    function get_department_groups() {
        $query = $this->db->get('department');
        return $query->result();
    }
     
    function get_department_group($id) {
        $sql = "SELECT * FROM department WHERE id = ?";
        $query = $this->db->query($sql, array($id));
        return $query->result();
    }   
      
    function get_agency() {
        $sql = "SELECT * FROM agency";
        $query = $this->db->query($sql);
        return $query->result();
    }       
          
    function get_roles() {
        $sql = "SELECT * FROM roles";
        $query = $this->db->query($sql);
        return $query->result();
    }    

    function get_department_roles($id) {               
        $sql = "SELECT * FROM roles WHERE department_id = $id";
        $query = $this->db->query($sql, $id);
        return $query->result();

    }        
    
    
}
