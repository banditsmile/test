<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

// ------------------------------------------------------------------------

/**
 * CodeIgniter Config Class
 */
class CI_Config
{

    /**
     * List of all loaded config values
     */
    var $config = array();

    /**
     * List of all loaded config files
     */
    var $is_loaded = array();

    /**
     * List of paths to search when trying to load a config file
     */
    var $_config_paths = array(APPPATH);

    /**
     * Constructor
     */
    function __construct()
    {
        $this->config =& get_config();
        log_message('debug', "Config Class Initialized");

        //在config/config.php里面有个配置项是base_url，它并不是必须配置项，如果没有配置，则系统就在这个地方
        //自己去它进行赋值。
        if ($this->config['base_url'] == '') {
            //一般来说，如果通过http访问网站的话，这个值都会有的。
            if (isset($_SERVER['HTTP_HOST'])) {
                //判断是否通过https方式访问。
                $base_url = isset($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) !== 'off' ? 'https' : 'http';
                $base_url .= '://' . $_SERVER['HTTP_HOST'];
                //去掉文件名部分。
                $base_url .= str_replace(basename($_SERVER['SCRIPT_NAME']), '', $_SERVER['SCRIPT_NAME']);
            } else {
                //如果发现没有$_SERVER['HTTP_HOST']，则直接设置为localhost
                $base_url = 'http://localhost/';
            }

            //保存到base_url中，以后像辅助函数uri_helper就可以通过base_url()调用出Config组件此值。
            $this->set_item('base_url', $base_url);
        }
    }

    // --------------------------------------------------------------------

    /**
     * Load Config File
     * 先解释一下load方法的参数，$file就是配置文件名。配置文件目录一般为应用目录(application)/config/下
     * 下面会有很多个针对不同方面配置的文件，而我们通过Config组件加载的配置信息都会保存在Config::$config这个
     * 属性里面，所以第二个参数$use_sections就是设置是否当前配置文件是否以独立一个数组的形式充当Config::$config
     * 的一个元素加入，如果为true，则$config是一个两层的数组，如果为false，则单纯将配置文件里面的配置信息合并。
     * 例如配置文件abc.php，如果为true，则会以$config['abc']['xxx']的形式保存，否则直接合并即会有
     * $config['xxx']。
     * 第三个参数只是设置要不要报错而已，如果为true，则只会返回false，如果为false则直接在函数执行时报错。
     */
    function load($file = '', $use_sections = FALSE, $fail_gracefully = FALSE)
    {
        //接下来这一行代码是为了方便我们调用的时候既可以以xxx.php的形式传参，也可以只以xxx（无后缀）的形式。
        //另外如果$file为空，则默认是加载config.php
        $file = ($file == '') ? 'config' : str_replace('.php', '', $file);

        $found = FALSE;
        $loaded = FALSE;

        //这个$this->_config_paths默认只有应用目录application/
        foreach ($this->_config_paths as $path) {
            //分别从某特定环境的配置目录和默认的配置目录里面寻找。
            $check_locations = defined('ENVIRONMENT')
                ? array(ENVIRONMENT . '/' . $file, $file)
                : array($file);

            foreach ($check_locations as $location) {
                $file_path = $path . 'config/' . $location . '.php';

                if (in_array($file_path, $this->is_loaded, TRUE)) {
                    $loaded = TRUE;
                    continue 2;//如果是已经加载过了，那么在Config::$config里面理应当有，所以直接跳出最外层循环。
                }

                if (file_exists($file_path)) {
                    $found = TRUE;//如果找到了一个，就不再找了。所以相同的配置文件仅会有一个有效。
                    break;
                }
            }

            //$found是用于判断在此$path里面，遍历上面的$check_locations有没有找到
            //而$load则是用于判断两层遍历以后，最终有没有把配置文件加载进来。
            if ($found === FALSE) {
                continue;
            }

            //配置文件就是在这个地方加载的，
            include($file_path);

            //下面这句可以看出，我们在包含的配置文件里面必须要有名为$config的数组。
            //如果配置信息格式不合法，看情况（$$fail_gracefully的作用）处理错误。
            if (!isset($config) OR !is_array($config)) {

                if ($fail_gracefully === TRUE) {
                    return FALSE;
                }
                show_error('Your ' . $file_path . ' file does not appear to contain a valid configuration array.');
            }

            //下面就是$use_sections的作用，根据它来规定当前加载的配置信息的保存形式。
            if ($use_sections === TRUE) {
                if (isset($this->config[$file])) {
                    $this->config[$file] = array_merge($this->config[$file], $config);
                } else {
                    $this->config[$file] = $config;
                }
            } else {
                $this->config = array_merge($this->config, $config);
            }

            //保存哪些文件已经加载过，下次再调用此load方法的时候，通过它来避免重复加载，减少不必要的操作。
            $this->is_loaded[] = $file_path;
            unset($config);

            $loaded = TRUE;
            log_message('debug', 'Config file loaded: ' . $file_path);
            break;
        }

        //加载失败，按情况处理错误。
        if ($loaded === FALSE) {
            if ($fail_gracefully === TRUE) {
                return FALSE;
            }
            show_error('The configuration file ' . $file . '.php' . ' does not exist.');
        }

        //来到这里，说明了一切都很顺利，返回true。
        return TRUE;
    }

    // --------------------------------------------------------------------

    /**
     * Fetch a config file item
     * 取得某一配置项的内容，如果知道上面Config::load($file, $use_sections, $fail_gracefully);方法
     * 中$use_sections的意义的话，那个下面的$index意义就很容易理解了。
     */
    function item($item, $index = '')
    {
        if ($index == '') {
            if (!isset($this->config[$item])) {
                return FALSE;
            }

            $pref = $this->config[$item];
        } else {
            if (!isset($this->config[$index])) {
                return FALSE;
            }

            if (!isset($this->config[$index][$item])) {
                return FALSE;
            }

            $pref = $this->config[$index][$item];
        }

        return $pref;
    }

    // --------------------------------------------------------------------

    /**
     * Fetch a config file item - adds slash after item (if item is not empty)
     */
    //此方法仅仅是对配置信息进行一些修剪处理而已。
    function slash_item($item)
    {
        if (!isset($this->config[$item])) {
            return FALSE;
        }
        //如果此配置项仅仅是包含一些对配置无效的字符，则直接返回空。
        if (trim($this->config[$item]) == '') {
            return '';
        }

        //保证以一条/结尾。
        return rtrim($this->config[$item], '/') . '/';
    }

    // --------------------------------------------------------------------

    /**
     * Site URL
     */
    //我们经常通过url_helper的site_url获得我们在项目中想要的路径，其实真正执行的是Config::site_url()这个方法。
    function site_url($uri = '')
    {
        //$uri参数实质可以是数组的

        if ($uri == '') {
            return $this->slash_item('base_url') . $this->item('index_page');
        }

        //根据当前的路由格式返回相应的uri_string
        if ($this->item('enable_query_strings') == FALSE) {
            $suffix = ($this->item('url_suffix') == FALSE) ? '' : $this->item('url_suffix');
            return $this->slash_item('base_url') . $this->slash_item('index_page') . $this->_uri_string($uri) . $suffix;
        } else {
            return $this->slash_item('base_url') . $this->item('index_page') . '?' . $this->_uri_string($uri);
        }
    }

    // -------------------------------------------------------------

    /**
     * Base URL
     */
    function base_url($uri = '')
    {
        return $this->slash_item('base_url') . ltrim($this->_uri_string($uri), '/');
    }

    // -------------------------------------------------------------

    /**
     * Build URI string for use in Config::site_url() and Config::base_url()
     */
    protected function _uri_string($uri)
    {
        /**
         * 按当前规定路由格式，返回正确的uri_string.
         * 主要是如果当参数$uri是数组的时候的一些处理。
         */
        if ($this->item('enable_query_strings') == FALSE) {
            if (is_array($uri)) {
                $uri = implode('/', $uri);
            }
            $uri = trim($uri, '/');
        } else {
            if (is_array($uri)) {
                $i = 0;
                $str = '';
                foreach ($uri as $key => $val) {
                    $prefix = ($i == 0) ? '' : '&';
                    $str .= $prefix . $key . '=' . $val;
                    $i++;
                }
                $uri = $str;
            }
        }
        return $uri;
    }

    // --------------------------------------------------------------------

    /**
     * System URL
     */
    function system_url()
    {
        //厄，下面这行这么奇葩的代码，其实只是为拿到系统目录的路径而已。
        //正则部分是首先去掉BASEPATH中多余重复的“/”,然后再拆分为数组。最后通过end()函数来拿到系统目录名。
        $x = explode("/", preg_replace("|/*(.+?)/*$|", "\\1", BASEPATH));
        return $this->slash_item('base_url') . end($x) . '/';
    }

    // --------------------------------------------------------------------

    /**
     * Set a config file item
     */
    function set_item($item, $value)
    {
        $this->config[$item] = $value;
    }

    // --------------------------------------------------------------------

    /**
     * Assign to Config
     */
    /**
     * 下面这个方法在CodeIgniter.php中调用过，是为把在index.php里设置的配置信息交给Config组件。
     * 实质也是通过上面的Config::set_item();方法设置。
     */
    function _assign_to_config($items = array())
    {
        if (is_array($items)) {
            foreach ($items as $key => $val) {
                $this->set_item($key, $val);
            }
        }
    }
}