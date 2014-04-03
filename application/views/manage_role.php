      <div class="starter-template">
        <h1>Manage Role</h1>
        <table class="table table-condensed table-bordered">
            <th>
                <td><b>Role</b></td>
                <td><b>Role ID</b></td>
                <td><b>Department ID</b></td>  
                <td><b>New Role Name</b></td>
                <td><b>New Department ID</b></td>  
                <td><b></b></td>
                
            </th>
            <?php $i = 0;
            foreach ($role as $each):?>
            <tr>
                <td><?php  $i++; echo $i;?></td>
                <td><?php echo $each->title;?></td>
                <td><?php echo $each->id;?></td>
                <td><?php echo $each->department_id;?></td>
                
            <form action="<?php echo base_url(); ?>manage_role/edit_group" method="POST">
                    <input type="hidden" name="id" value="<?php echo $each->id;?>" />
                    <td><input class="form-control" type="text" name="title" value="<?php echo $each->title;?>" /></td>

                    <td>                   
                        <select name="department_id" class="form-control">
                            <?php foreach($departments as $d){ ?>
                                <option value="<?php echo $d->id; ?>"<?php if ($each->department_id == $d->id) echo 'selected="selected"';?>><?php echo $d->name;?></option>';
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
                <form action="<?php echo base_url(); ?>manage_role/new_group" method="POST">
                    <td></td> 
                    <td><input type="text" class="form-control" name="title" /></td>
                    <td></td>     
                    <td><button type="submit" class="btn">Add</button></td>
                </form>
            </tr>
            
      
       </table>
      </div>