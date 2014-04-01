      <div class="starter-template">
        <h1>Manage Department</h1>
        <table class="table table-condensed table-bordered">
            <th>    
                <td><b>Department Name</b></td>                
                <td><b>Role ID</b></td>
                <td><b>Agency ID</b></td>
                <td><b>New Department Name</b></td>                
                <td><b>New Role ID</b></td>
                <td><b>New Agency ID</b></td>
                <td><b></b></td>
                
            </th>
            <?php $i = 0;
            foreach ($departments as $each):?>
            <tr>
                <td><?php  $i++; echo $i;?></td>
                <td><?php echo $each->name;?></td>
                <td><?php echo $each->roles_id;?></td> 
                <td><?php echo $each->agency_id;?></td> 

                <form action="<?php echo base_url(); ?>manage_department/edit_group" method="POST">
            
                    <input type="hidden" name="id" value="<?php echo $each->id;?>" />
                    <td><input type="text" class="form-control" name="name" value="<?php echo $each->name;?>" /></td>.
                                        
                    <td>                   
                        <select name="roles_id" class="form-control">
                            <?php foreach($roles as $r){ ?>
                                <option value="<?php echo $r->id; ?>"<?php if ($each->roles_id == $r->id) echo 'selected="selected"';?>><?php echo $r->title; ?></option>';
                            <?php } ?>
                        </select>                  

                    </td>
                    
                    <td>
                        <select name="agency_id" class="form-control">
                            <?php foreach($agency as $a){ ?>                                                            
                                <option value="<?php echo $a->id; ?>"<?php if ($each->agency_id == $a->id) echo 'selected="selected"';?>><?php echo $a->name; ?></option>';
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
                <td></td>
                <form action="<?php echo base_url(); ?>manage_department/new_group" method="POST">
                    <td><input class="form-control" type="text" name="name" /></td>
                    <td></td>
                    <td></td>
                    <td><button type="submit" class="btn">Add</button></td>
                </form>
            </tr>
       </table>
      </div>