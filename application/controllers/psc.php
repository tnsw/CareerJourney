<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class PSC extends CI_Controller {

    function index()
	{
                 $this->load->model("PSC_role_mdl", '', TRUE);
                $data["title"] = "Public Sector Commission";
                $data["page"] = "PSC";
                $data["agency"]= $this->PSC_role_mdl->get_Agency();
                $data["department"]= $this->PSC_role_mdl->get_Department();
                $data["roles"]= $this->PSC_role_mdl->get_Roles();
		$this->load->view('header', $data);                
		$this->load->view('psc');
                $this->load->view('footer');
	}
}
