<!--网页主体-->
<div ><span id="tips" style="float:right">aaa</span></div>
<table class="table table-striped table-bordered" id="list_table">
    <thead>
    <th><input type="checkbox" name="check_all"></th><th>文件</th><th>大小</th><th>修改日期</th><th>操作</th>
    </thead>
    <tbody>
    <?php foreach($list as $key=>$item):?>
        <tr class="success">
            <td><input type="checkbox" name="item" value="<?php echo $key;?>"></td>
            <td>
                <?php if($item['type']=='d'):?>
                    <span class="glyphicon glyphicon-folder-close" aria-hidden="true" ></span>
                <?php endif;?>
                <span class="<?php echo $item['type'];?>"><?php echo $item['name'];?></span>

            </td>
            <td><?php echo $item['size'];?></td>
            <td><?php echo $item['date'];?></td>
            <td>
                <?php if($item['type']!='d'):?>
                    <button type="button" class="list-group-item download" data="<?php echo $item['name'];?>">下载</button>
                <?php endif;?>
            </td>
        </tr>
    <?php endforeach;?>
    </tbody>
</table>
<script>
    $(document).ready(function(){

    })
</script>