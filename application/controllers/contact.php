<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Contact extends CI_Controller {

    function index()
	{
                $data["title"] = "TfNSW Career Journey Prototype";
                $data["page"] = "Contact";
		$this->load->view('header', $data);                
		$this->load->view('contact');
                $this->load->view('footer');
	}
}
