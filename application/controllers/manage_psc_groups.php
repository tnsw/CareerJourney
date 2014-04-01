<?php

class Manage_PSC_Groups extends CI_Controller {

    function index() {
        $this->load->model("PSC_mdl", '', TRUE);
        $data["title"] = "Manage PSC Groups";
        $data["page"] = "Manage";
        $data["PSC_Groups"] = $this->PSC_mdl->get_psc_groups();
        $this->load->view('header', $data);
        $this->load->view('manage_psc_groups',$data);
        $this->load->view('footer');
    }
    
    function edit_group() {
        $this->load->model("PSC_mdl", '', TRUE);
        if ($this->input->post("name") != "") {
            $this->PSC_mdl->update_psc_group($this->input->post("id"),$this->input->post("name"));
        } else {
            $this->PSC_mdl->delete_psc_group($this->input->post("id"));
        }
        redirect(base_url() . "manage_psc_groups");
    }

    function new_group() {
        $this->load->model("PSC_mdl", '', TRUE);
        if ($this->input->post("name") != "") {
            $this->PSC_mdl->insert_psc_group($this->input->post("name"));
        }
        redirect(base_url() . "manage_psc_groups");
    }

}
