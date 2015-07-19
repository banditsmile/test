<!--网页主体-->
<div class="col-md-10">
    <table class="table table-striped table-bordered">
        <thead>
        <th><input type="checkbox" name="check_all"></th><th>文件名</th><th>大小</th><th>修改日期</th>
        </thead>
        <tbody>
        <?php foreach($list as $key=>$item):?>
        <tr class="success">
            <td><input type="checkbox" name="item" value="<?php echo $key;?>"></td>
            <td>
                <?php if($item['type']=='d'):?>
                    <span class="glyphicon glyphicon-folder-close" aria-hidden="true" ></span>
                <?php endif;?>
                <?php echo $item['name'];?>
            </td>
            <td><?php echo $item['size'];?></td>
            <td><?php echo $item['date'];?></td>
        </tr>
        <?php endforeach;?>
        </tbody>
    </table>
</div>