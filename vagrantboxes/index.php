<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>A list of base boxes for Vagrant - Vagrantbox.es</title>
  <link rel="stylesheet" href="assets/css/main.css" type="text/css" />
  <link rel="stylesheet" href="assets/css/tipsy.css" type="text/css">
  <link rel="stylesheet" href="//cdn.bootcss.com/datatables/1.10.2/css/jquery.dataTables.min.css" type="text/css" />
  <script src="//cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
  <script src="assets/ZeroClipboard.min.js"></script>
  <script src="assets/jquery.tipsy.js"></script>
  <script src="//cdn.bootcss.com/datatables/1.10.2/js/jquery.dataTables.min.js"></script>

  <script>

    ZeroClipboard.setDefaults({moviePath: 'assets/ZeroClipboard.swf'});

    $(document).ready(function() {
      $('td').each(function(i, e) {
        var content = $(e).html();
        if(content.indexOf('http') == 0) {
          var url = content;
          content = '<button class="zeroclipboard-button" data-clipboard-text="' + url + '" trigger-title="Done" title="Copy to clipboard">Copy</button> ' + url;
          $(e).html(content);
        }
      });

      var clip = new ZeroClipboard($('.zeroclipboard-button'));
      clip.on('load', function(client, args) {
        $(client.htmlBridge).tipsy();
      });

      clip.on('noflash wrongflash', function(client, args) {
        $('.zeroclipboard-button').hide();
      });

      clip.on('complete', function(client, args) {
        var b = $(client.htmlBridge);
        b.prop('title', $(this).attr('trigger-title'));
        b.tipsy('show');
      });

      $(window).resize(function() {
        clip.reposition();
      });

      var table = $('#dataTable').dataTable({
        order: [],
        paging: false,
      });

    });
  </script>
  <style>
    .zeroclipboard-button {
      text-align:center;
      background-color: #eeeeee;
      border: 1px solid gray;
    }

    .zeroclipboard-button.zeroclipboard-is-hover { background-color: #dddddd; }
    .zeroclipboard-button.zeroclipboard-is-active { background-color: #aaaaaa; }
  </style>
</head>

<body>

<a href="https://github.com/garethr/vagrantboxes-heroku"><img style="position: absolute; top: 0; right: 0; border: 0;" src="assets/forkme_right_orange_ff7600.png" alt="Fork me on GitHub"></a>

<div id="main">

  <h1><a href="/">Vagrantbox.es</a></h1>

  <p><a href="http://vagrantup.com">Vagrant</a> is an amazing tool for managing virtual machines via a simple to use command line interface. With a simple <code>vagrant up</code> you can be working in a clean environment based on a standard template.</p>

  <p>These standard templates are called <a href="http://docs.vagrantup.com/v2/boxes.html">base boxes</a>, and this website is simply a list of boxes people have been nice enough to make publicly available.</p>

  <h2>Suggest a Box</h2>

  <p>Do you know of another base box? <a href="http://github.com/garethr/vagrantboxes-heroku">Send a pull request</a> and we'll add it to the list below.</p>

  <h2>Available Boxes</h2>

  <p>To use the available boxes just replace {title} and {url} with the information in the table below.</p>

<pre>
 <span>$ </span>vagrant box add {title} {url}
 <span>$ </span>vagrant init {title}
 <span>$ </span>vagrant up
</pre>

  <table id="dataTable" class="stripe cell-border row-border" width="100%">
    <thead>
    <tr><th>Name</th><th>Provider</th><th>URL</th><th></th><th>Size (MB)</th></tr>
    </thead>
    <tbody>
    <?php
    include 'simple_html_dom/simple_html_dom.php';
    $html = file_get_html('./index.html');
    $j = 0;
    foreach($html->find('#dataTable tr') as $tr){
      if($j++ ==0){
        continue;
      }
      $tr_str = '<tr>';
      $i=0;
      foreach($tr->find('td') as $td){
        $i++;
        $tr_str .= $td->outertext.PHP_EOL;
        if($i==3){
          $tr_str.='<td></td>'.PHP_EOL;
        }
      }
      $tr_str.='</tr>'.PHP_EOL;
      echo $tr_str;
    }
    ?>
    </tbody>
  </table>

  <div id="footer">
    <p>A project from <a href="http://morethanseven.net">Gareth Rushgrove</a>. The design of this site is heavily inspired by the lovely <a href="http://vagrantup.com">Vagrant</a> design by <a href="http://www.simonecarletti.com/">Simone Carletti</a>.</p>
  </div>

</div>

</body>
</html>
