<?php

class PSC_Data_Editor extends CI_Controller {

    function index() {
        $data["title"] = "PSC Data Editor";
        $this->load->view('header', $data);
        $this->load->view('psc_data_editor',$data);
        $this->load->view('footer');
    }

}
