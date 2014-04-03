<?php


class Manage_Role extends CI_Controller {

    function index() {
        $this->load->model("Role_mdl", '', TRUE);
        $data["title"] = "Manage Roles";
        $data["page"] = "Manage";
        $data["departments"] = $this->Role_mdl->get_department_groups();
        $data["role"] = $this->Role_mdl->get_role_groups();
        $this->load->view('header', $data);
        $this->load->view('manage_role',$data);
        $this->load->view('footer');
    }
    
    function edit_group() {
        $this->load->model("Role_mdl", '', TRUE);
        if ($this->input->post("title") != "") {
            $this->Role_mdl->update_role_group($this->input->post("id"),$this->input->post("title"),$this->input->post("department_id"));
        } else {
            $this->Role_mdl->delete_role_group($this->input->post("id"));
        }
        redirect(base_url() . "manage_role");
    }

    function new_group() {
        $this->load->model("Role_mdl", '', TRUE);
        if ($this->input->post("title") != "") {
            $this->Role_mdl->insert_role_group($this->input->post("title"));
        }
        redirect(base_url() . "manage_role");
    }

}
