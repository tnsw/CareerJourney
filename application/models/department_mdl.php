<?php

class Department_mdl extends CI_Model {
    
        function __construct()
    {
        parent::__construct();
    }
    
    var $name;
    
    function insert_department_group($name) {
        $this->name = $name;
        $this->db->insert('department', $this);
    }
    
    function update_department_group($id,$name,$agency_id,$roles_id) {
        $this->name = $name;
        $this->agency_id = $agency_id;
        $this->roles_id = $roles_id;
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
      
    
   function get_roles_demo()
    {
        $query = $this->db->get('roles');
            if ($query->num_rows >= 1)
            {
                foreach($query->result_array() as $row)
                {
                    $data[$row['id']]=$row['title'];
                }
                return $data;
            }
    }    
       
    
    function get_Roles() {
        $sql = "SELECT * FROM Roles";
        $query = $this->db->query($sql);
        return $query->result();
    }   
    
    function get_Agency() {
        $sql = "SELECT * FROM Agency";
        $query = $this->db->query($sql);
        return $query->result();
    }       

    
}