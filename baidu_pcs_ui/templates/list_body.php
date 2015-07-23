<div class="col-md-10" id="page_content">
</div>
<script>
	var base_path = '/';
	function get_list(path){
		$.ajax({
			url:'http://test.centos65.home/baidu_pcs_ui/index.php',
			data:{action:'get_list',path:path},
			success:function(data){
				$('#page_content').html(data);
				$('#base_path').html(base_path);
			},
			dataType:'html'
		});
	}

	function download(file,path){
		$.ajax({
			url:'http://test.centos65.home/baidu_pcs_ui/index.php',
			data:{action:'download',path:path,'file':file},
			success:function(data){
				console.log(data);
			},
			dataType:'json'
		});
	}


	$(document).ready(function(){
		get_list();
	});
</script>