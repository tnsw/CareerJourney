<?php


class Manage_Agency extends CI_Controller {

    function index() {
        $this->load->model("Agency_mdl", '', TRUE);
        $data["title"] = "Manage Agency";
        $data["page"] = "Manage";
        $data["agency"] = $this->Agency_mdl->get_agency_groups();
        $this->load->view('header', $data);
        $this->load->view('manage_agency',$data);
        $this->load->view('footer');
    }
    
    function edit_group() {
        $this->load->model("Agency_mdl", '', TRUE);
        if ($this->input->post("name") != "") {
            $this->Agency_mdl->update_agency_group($this->input->post("id"),$this->input->post("name"));
        } else {
            $this->Agency_mdl->delete_agency_group($this->input->post("id"));
        }
        redirect(base_url() . "manage_agency");
    }

    function new_group() {
        $this->load->model("Agency_mdl", '', TRUE);
        if ($this->input->post("name") != "") {
            $this->Agency_mdl->insert_agency_group($this->input->post("name"));
        }
        redirect(base_url() . "manage_agency");
    }

}
