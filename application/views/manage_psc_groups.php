      <div class="starter-template">
        <h1>Manage Public Sector Capability Groups</h1>
        <table class="table table-condensed table-bordered">
            <th>
                <td><b>Pubic Sector Capability Groups</b></td>
                <td><b>Rename</b></td>
            </th>
            <?php $i = 0;
            foreach ($PSC_Groups as $group):?>
            <tr>
                <td><?php  $i++; echo $i;?></td>
                <td><?php echo $group->name;?></td>
            <form action="<?php echo base_url(); ?>manage_psc_groups/edit_group" method="POST">
                    <input type="hidden" name="id" value="<?php echo $group->id;?>" />
                    <td><input type="text" class="form-control" name="name" value="<?php echo $group->name;?>" /></td>
                    <td><button type="submit" class="btn">Edit</button></td>
                </form>
            </tr>
            <?php endforeach;?>
            <tr>
                <td></td>
                <td></td>
                <form action="<?php echo base_url(); ?>manage_psc_groups/new_group" method="POST">
                    <td><input type="text" class="form-control" name="name" /></td>
                    <td><button type="submit" class="btn">Add</button></td>
                </form>
            </tr>
       </table>
      </div>