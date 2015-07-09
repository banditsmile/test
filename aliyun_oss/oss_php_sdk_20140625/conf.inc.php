<?php
//个人测试




//自定义日志路径，如果没有设置，则使用系统默认路径，在./logs/
//define('ALI_LOG_PATH','');



//个人测试
//ACCESS_ID
define('OSS_ACCESS_ID', '6ltpchfckx9h8htgayp1txda');

//ACCESS_KEY
define('OSS_ACCESS_KEY', 'GbJioobYI2qRmPex+WYOvpPgS5Q=');

//OSS_BUCKET
define('OSS_BUCKET', 'icodeu');

//OSS_DOMAIN
define('OSS_DOMAIN', 'oss-cn-shenzhen.aliyuncs.com');

//是否记录日志
define('ALI_LOG', FALSE);

//自定义日志路径，如果没有设置，则使用系统默认路径，在./logs/
define('BASE_PATH',dirname(__FILE__));
define('ALI_LOG_PATH',BASE_PATH.'/logs/');

//是否显示LOG输出
define('ALI_DISPLAY_LOG', FALSE);

//语言版本设置
define('ALI_LANG', 'zh');