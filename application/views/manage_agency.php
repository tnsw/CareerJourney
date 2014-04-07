      <div class="starter-template">
        <h1>Manage Agency</h1>
        <table class="table table-condensed table-bordered">
            <th>
                <td><b>Agency</b></td>
                <td><b>Agency ID</b></td>
                <td><b>Rename</b></td>
                <td><b></b></td>
                
            </th>
            <?php $i = 0;
            foreach ($agency as $group):?>
            <tr>
                <td><?php  $i++; echo $i;?></td>
                <td><?php echo $group->name;?></td>
                <td><?php echo $group->id;?></td>
            <form action="<?php echo base_url(); ?>manage_agency/edit_group" method="POST">
                    <input type="hidden" name="id" value="<?php echo $group->id;?>" />
                    <td><input class="form-control" type="text" name="name" value="<?php echo $group->name;?>" /></td>
                    <td><button type="submit" class="btn">Edit</button></td>
                </form>
            </tr>
            <?php endforeach;?>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <form action="<?php echo base_url(); ?>manage_agency/new_group" method="POST">
                    <td><input type="text" class="form-control" name="name" /></td>
                    <td><button type="submit" class="btn">Add</button></td>
                </form>
            </tr>
       </table>
      </div>