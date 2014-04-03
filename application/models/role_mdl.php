<?php

class Role_mdl extends CI_Model {
    
        function __construct()
    {
        parent::__construct();
    }
    
    
    function insert_role_group($title) {
        $this->title = $title;
        $this->db->insert('roles', $this);
    }
    
    
    function update_role_group($id, $title, $department_id) {
        $this->title = $title;
        $this->department_id = $department_id;
        $this->db->update('roles', $this, array('id' => $id));
    }
    
    function delete_role_group($id) {
        $this->db->delete('roles', array('id' => $id));
    }
    
    function get_role_groups() {
        $query = $this->db->get('roles');
        return $query->result();
    }
     
    function get_role_group($id) {
        $sql = "SELECT * FROM roles WHERE id = ?";
        $query = $this->db->query($sql, array($id));
        return $query->result();
    }   

       
    function get_department_groups() {
        $query = $this->db->get('department');
        return $query->result();
    }
       
    
}
