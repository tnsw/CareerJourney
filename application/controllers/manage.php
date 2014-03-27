<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Manage extends CI_Controller {

    function index()
	{
                $data["title"] = "Home";
		$this->load->view('header', $data);                
		$this->load->view('manage');
                $this->load->view('footer');
	}
}
