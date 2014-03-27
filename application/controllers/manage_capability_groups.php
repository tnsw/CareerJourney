<?php

class Manage_Capability_Groups extends CI_Controller {

    function index() {
        $this->load->model("Capability_group", '', TRUE);
        $data["title"] = "Capability Groups";
        $data["capability_groups"] = $this->Capability_group->get_capability_groups();
        $this->load->view('header', $data);
        $this->load->view('manage_capability_groups',$data);
        $this->load->view('footer');
    }
    
    function edit_group() {
        $this->load->model("Capability_group", '', TRUE);
        if ($this->input->post("name") != "") {
            $this->Capability_group->update_capability_group($this->input->post("id"),$this->input->post("name"));
        } else {
            $this->Capability_group->delete_capability_group($this->input->post("id"));
        }
        redirect(base_url() . "manage_capability_groups");
    }

    function new_group() {
        $this->load->model("Capability_group", '', TRUE);
        if ($this->input->post("name") != "") {
            $this->Capability_group->insert_capability_group($this->input->post("name"));
        }
        redirect(base_url() . "manage_capability_groups");
    }

}
