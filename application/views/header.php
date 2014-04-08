<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php echo $title; ?></title>

    <!-- Bootstrap core CSS -->
    <link href="<?php echo asset_url();?>css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<?php echo asset_url();?>css/starter-template.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
    
    
  </head>

  <body>

  <!-- Navbar
    ================================================== -->      
      
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<?php echo base_url();?>">Career Journey App</a>
        </div>
          
               
          
        <!--<div class="navbar-collapse nav-collapse collapse navbar-header">-->
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
              <li class="<?php if ($page == "Home") echo 'active';?>"><a href="<?php echo base_url();?>home">Home</a></li>
              <li class="<?php if ($page == "PSC") echo 'active';?>"><a href="<?php echo base_url();?>psc">PSC</a></li>
              <li class="<?php if ($page == "OSC") echo 'active';?>"><a href="<?php echo base_url();?>osc">OSC</a></li>              
              <li class="dropdown"><a href ="" class="dropdown-toggle" data-toggle="dropdown">Career <b class="caret"></b></a>
              <ul class="dropdown-menu" role="menu">    
                    <li><a href="<?php echo base_url();?>home">Career Exploration</a></li>
                    <li><a href="<?php echo base_url();?>home">Career Topography</a></li>    
              </ul>  
              </li>              
              <li class="<?php if ($page == "PDP") echo 'active';?>"><a href="<?php echo base_url();?>home">PDP</a></li>
              <li class="<?php if ($page == "Links") echo 'active';?>"><a href="<?php echo base_url();?>home">Links</a></li>    
              <li class="<?php if ($page == "Manage") echo 'active';?>"><a href="<?php echo base_url();?>manage">Manage</a></li>
          </ul> 
        
        
          <ul class ="nav navbar-nav navbar-right">
               <li class="active"><a class="navbar-right" href="<?php echo base_url();?>contact">More Information</a></li>
          </ul>
        </div><!--/.nav-collapse -->
        
      </div>
    </div>

    <div class="container">

<!-- Masthead
================================================== -->
      
      
