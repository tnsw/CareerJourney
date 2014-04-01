<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller {

    function index()
	{
                $data["title"] = "TfNSW Career Journey Prototype";
                $data["page"] = "Home";
		$this->load->view('header', $data);                
		$this->load->view('home');
                $this->load->view('footer');
	}
}
