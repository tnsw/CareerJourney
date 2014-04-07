<?php

class Manage_Department extends CI_Controller {
 
        
    
    function index() {
        $this->load->model("Department_mdl", '', TRUE);
        $data["title"] = "Manage Department";
        $data["page"] = "Manage";
        $data["departments"] = $this->Department_mdl->get_department_groups();
        $data["agency"] = $this->Department_mdl->get_agency();
        
        $this->load->view('header', $data);
        $this->load->view('manage_department',$data);
        $this->load->view('footer');
        
   
    }
    
    function edit_group() {
        $this->load->model("Department_mdl", '', TRUE);
        if ($this->input->post("name") != "") {
            $this->Department_mdl->update_department_group($this->input->post("id"),$this->input->post("name"),$this->input->post("agency_id"));
        } else {
            $this->Department_mdl->delete_department_group($this->input->post("id"));
        }
        redirect(base_url() . "manage_department");
    }

    function new_group() {
        $this->load->model("Department_mdl", '', TRUE);
        if ($this->input->post("name") != "") {
            $this->Department_mdl->insert_department_group($this->input->post("name"), $this->input->post("agency_id"));
        }
        redirect(base_url() . "manage_department");
    }

    function show_roles() {
        
        $this->load->model("Department_mdl", '', TRUE);
                  
        $data["title"] = "Manage Department";
        $data["page"] = "Manage";
        $data["departments"] = $this->Department_mdl->get_department_groups();
        $data["agency"] = $this->Department_mdl->get_agency();        
        $data["listroles"] = $this->Department_mdl->get_department_roles($this->input->post("department_id"));   
        $data["search"] = $this->input->post("department_id");
        
        $this->load->view('header', $data);        
        $this->load->view('manage_department',$data);
        $this->load->view('footer');        
        
      
        
    }  

}
