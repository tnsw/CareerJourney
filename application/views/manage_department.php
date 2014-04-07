      <div class="starter-template">
        <h1>Manage Department</h1>
        <table class="table table-condensed table-bordered">
            <th>    
                <td><b>Department Name</b></td>                
                <td><b>Agency ID</b></td>
                <td><b>New Department Name</b></td>                
                <td><b>New Agency ID</b></td>
                <td><b></b></td>
                
            </th>
            <tbody>
            <?php $i = 0;
            foreach ($departments as $each):?>
            <tr>
                <td><?php  $i++; echo $i;?></td>
                <td><?php echo $each->name;?></td>
                <td><?php echo $each->agency_id;?></td> 

                <form action="<?php echo base_url(); ?>manage_department/edit_group" method="POST">
            
                    <input type="hidden" name="id" value="<?php echo $each->id;?>" />
                    <td><input type="text" class="form-control" name="name" value="<?php echo $each->name;?>" /></td>.
                    
                    <td>
                        <select name="agency_id" class="form-control">
                            <?php foreach($agency as $a){ ?>      
                                <option value="<?php echo $a->id; ?>"<?php if ($each->agency_id == $a->id) echo 'selected="selected"';?>><?php echo $a->name; ?></option>             
                            <?php } ?>
                              
                        </select>                          
                    </td>          
                                                                              
                    <td><button type="submit" class="btn">Edit</button></td>
                    
                </form>   
                
            </tr>

            <?php endforeach;?>  

            
            <tr>
                <td></td>
                <td></td>
                <td></td>                
                <form action="<?php echo base_url(); ?>manage_department/new_group" method="POST">
                    <td><input class="form-control" type="text" name="name" /></td>
                    <td>
                        <select name="agency_id" class="form-control">
                            <?php foreach($agency as $a){ ?>      
                                <option value="<?php echo $a->id; ?>"><?php echo $a->name; ?></option>             
                            <?php } ?>
                              
                        </select>                          
                    </td>    
                    <td><button type="submit" class="btn">Add</button></td>
                </form>

            </tr>
            </tbody>
       </table>
      </div>
      <div class="col-md-8">
          
          
        <table class="table table-condensed">
            <th>    
                <td width="40%"><b>Department Name</b></td>                
                <td width="60%"><b>Roles</b></td>    
                <td></td>    

            </th>
            <tr>
                <td></td>

                
                <form action="<?php echo base_url(); ?>manage_department/show_roles" method="POST">
                    <td>
                    <select name="department_id" class="form-control">
                        
                        <?php foreach($departments as $d){ ?>  
                                                        
                            <?php if(!empty($listroles)){ ;?>
                                <option value="<?php echo $d->id ;?>"<?php if ($d->id == $search) echo 'selected="selected"';?>><?php echo $d->name; ?></option>    
                                                                   
                            <?php } else{;?>
                                
                                <option value="<?php echo $d->id ;?>"><?php echo $d->name; ?></option>
                                
                            <?php };?>    
                                
                     <?php } ;?>                                 
                                
                    </select>    
                        
                        

                        
                    </td>
                    
                    <td>

                        <?php if(!empty($listroles)){ ;?>
                        
                            <?php foreach ($listroles as $l):?>                        

                                <p><?php echo $l->title;?></p>  
                                
                           <?php endforeach;?>

                        <?php } ;?> 

                             
                    </td>
                    
                    <td><button type="submit" class="btn">Show</button></td>
                </form>                        

            </tr>
            
            
         </table>
        
        
      </div>