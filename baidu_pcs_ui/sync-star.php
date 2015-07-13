<?php
/* 
 * This file is part of SyncStar, which can be found at http://the-sync-star.com
 * You can use this file only if you use SyncStar PC client.
 * 
 */

define('SYNC_STAR_DATA_FOLDER','~sync-star');
define('RECYCLE_NAME', '~sync-star/recycle');
define('BULKY_FOLDER', '~sync-star/tmp_data');
define('USER_INFO_FILE', '~sync-star/users/pwd.txt');
define('CLIENT_VERSION', '17');
define('TEMP_ZIP_FILE', '~sync-star/__sync_star_zip_download121206.zip');
define('SYNC_STAR_FILE_TIME', '__sync_star___time_info.txt');
//define('DB_BACKUP_FOLDER', 'SyncStarDBBkUp');
define('UTF8_HEADER', "\xef\xbb\xbf");



/*
mysqldump -u<username> -p<password> <database name> > <output file>
mysql -u<username> -p<password> <database name> < <input file>
*/


//----------- error code -----------
define ('err_none','0');
define ('err_general', '50');
define ('err_invalid_client_version', '100');
define ('err_cannot_create_zip', '110');
define ('err_file_not_found', '120');
define ('err_cannot_open_file', '130');
define ('err_new_name_missing', '140');
define ('err_cannot_rename_missing_src', '150');
define ('err_cannot_rename_dest_exists', '160');
define ('err_fail_to_rename', '170');
define ('err_cannot_del_file', '180');
define ('err_cannot_del_folder', '190');
define ('err_uploaded_file_not_found', '200');
define ('err_preuploaded_file_not_found', '210');
define ('err_invalid_upload_file_name', '220');
define ('err_time_stamp_count_mismatch', '230');
define ('err_file_name_count_mismatch', '240');
define ('err_fail_to_save_file', '250');
define ('err_unzip_partly_fail', '260');
define ('err_invalid_pwd', '270');
define ('err_fail_to_change_pwd', '280');

function Var_ClientVersion() 	{ $n = 'client_version'; 		return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_PathOnServer() 	{ $n = 'UrlEnc_path_on_server'; return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_ForceSave()    	{ $n = 'force_save'; 			return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_RevName()      	{ $n = 'rev_name'; 				return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_IgnoredFolders()   { $n = 'ignored_folders'; 		return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_CurTimeStamp() 	{ $n = 'cur_time_stamp'; 		return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_CurTimeStr()    	{ $n = 'cur_time_str';          return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_FileTimeStamp()	{ $n = 'file_time_stamp'; 		return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_RenameTo()  		{ $n = 'rename_to';				return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_UnzipToFolder()  	{ $n = 'unzip_to_folder';		return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_DownloadOffset()  	{ $n = 'download_offset';		return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_UseRecycleBin()    { $n = 'use_recycle_bin';		return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }


function Var_DBName()           { $n = 'db_name';               return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_DBUser()           { $n = 'db_user';               return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_DBPwd()            { $n = 'db_pwd';                return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function Var_DBFileRelPath()    { $n = 'db_file_rel_path';		return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }


function VarCmd_ListFolder()  	{ $n = 'cmd_list_folder';		return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function VarCmd_UploadZipped()  { $n = 'cmd_upload_zipped_file';return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function VarCmd_DownloadZipped(){ $n = 'cmd_download_zipped';	return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function VarCmd_DownloadAutoZip(){$n = 'cmd_download_auto_zip'; return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function VarCmd_DownloadFile()  { $n = 'cmd_download_file';	 	return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function VarCmd_Rename()  		{ $n = 'cmd_rename_from';		return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function VarCmd_Delete()  		{ $n = 'cmd_delete';	 		return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function VarCmd_UploadAutoZip() { $n = 'cmd_upload_auto_zip';   return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }

function VarCmd_BackupDB()      { $n = 'cmd_backup_db';         return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function VarCmd_RestoreDB()     { $n = 'cmd_restore_db';        return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }

function VarCmd_ChangePwdTo()   { $n = 'cmd_change_pwd_to';   return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }
function VarCmd_CreateFolder()  { $n = 'cmd_create_folder';   return isset($_POST[$n]) ? $_POST[$n] : FALSE ;   }



define ('DATA_FLAG_COMPRESSED_STREAM','c');
define ('DATA_FLAG_RAW_STREAM' , 'r');

define ('DATA_TYPE_FILE_INFO',     'f');
define ('DATA_TYPE_FILE_CONTENT' , 't');
define ('DATA_TYPE_DIR_CHANGE' ,   'd');
define ('DATA_TYPE_FOLDER' ,       'o');
define ('DATA_TYPE_PROGRESS',      'p');
define ('DATA_TYPE_ERROR_CODE',      'e');

define ('DIR_CHANGE_SAVE' , 'save');
define ('DIR_CHANGE_RENAME' , 'rename');
define ('DIR_CHANGE_DELETE' , 'delete');


$GLOBALS['g_invalid_pwd'] = false;
$GLOBALS['g_password'] = '';//by default, now password
$GLOBALS['g_iv'] = 'ThisIsAVector,32BytesInTotal.Req';


//php 5.3 did not define hex2bin
function hex2bin2($hex_string) 
{
    $len = strlen($hex_string);
    return pack("H" . $len, $hex_string);
}

function addpadding($string, $blocksize = 32)
{
    $len = strlen($string);
    $pad = $blocksize - ($len % $blocksize);
    $string .= str_repeat(chr($pad), $pad);
    return $string;
}

function strippadding($string)
{
    $slast = ord(substr($string, -1));
    $slastc = chr($slast);
    //$pcheck = substr($string, -$slast);
    if(preg_match("/$slastc{".$slast."}/", $string)){
        $string = substr($string, 0, strlen($string)-$slast);
        return $string;
    } else {
        return false;
    }
}

function _GetPaddedKey($key)
{
    static $last_key = NULL;
    static $last_key2 = NULL;
    if(strlen($key) == 0)
        $key = '1234';
    if($last_key2  != $key)
    {
        $last_key = MD5($key, true ) .  MD5($key . $key, true );
        $last_key2 = $key;
    }
    return $last_key;
}

function AES_Encrypt_1($key,  $text)
{
    if(strlen($key) == 0)
        return bin2hex($text); //no encryption
    global $g_iv;
    //use MD5 to get 32 char key
    $key = _GetPaddedKey($key);
    
	$ret = bin2hex(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $key, addpadding($text), MCRYPT_MODE_CBC, $g_iv));
    return $ret;
}

function AES_Encrypt($key,  $text)
{
    return AES_Encrypt_1($key, $text . 'Good');
}


function AES_Decrypt_1($key, $encrypted_text)
{
	$string = hex2bin2($encrypted_text);
    if(strlen($key) == 0)
        return $string; //no encryption
    
    global $g_iv;

    $key = _GetPaddedKey($key);

	$ret = strippadding(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, $key, $string, MCRYPT_MODE_CBC, $g_iv));
    return $ret;
}      

function AES_Decrypt($key, $encrypted_text)
{
    $ret = AES_Decrypt_1($key,$encrypted_text );
    if(substr($ret,-4) == 'Good')
    {
        return substr($ret,0, -4);
    }
    $GLOBALS['g_invalid_pwd'] = true;
    return false;
}
        
//$key = 'abcdefg';
//echo "\r\n" . AES_Encrypt($key, "Hello, world!") . "\r\n";
//echo AES_Decrypt($key, '993BD24E3069D01C9E71663987E571942B6D6A2071598A30') . "\r\n";

function ________utils___________(){}

//add starting '/', and clear ending '/'. if empty, just return empty
function CleanPathName($name)
{
	$name = trim(str_replace('\\','/',$name));
	//do not start with /
	if(substr($name,0,1) != '/')
		$name = '/' . $name;
	//do not end with /
	if(substr($name,-1) == '/')
	{
		$name = substr($name,0,-1);
	}
			
	if($name == '/')
		return '';
	return $name;
}

//server path will be added
//if file_name is empty, return the path, no ending '/'
function FullPathOf($file_name)
{
	$ret = dirname(__FILE__) . CleanPathName(Var_PathOnServer());
	
	$f1 = CleanPathName($file_name);
    $f = str_replace('../', '/', $f1);//do not allow root access
	if(strlen($f) == 0)
		return $ret;
	return $ret . $f;
}

//correct the multibyte issue
function basename2($f)
{
	$f = str_replace("\\",'/',$f);
	$i = strlen(dirname($f));
	if($i > 0)
	{
		return substr($f, $i+1);
	}
	return $f;
}

//echo basename2('/abc/ef/ffsdf/good.txt') . ', ';
//echo basename2('/abc/ef/ffsdf\good.txt') . ', ';
//echo basename2('/abc/ef/ffsdf\测试good.txt') . ', ';

//based on Path On server
function RelativePathOf($full_path)
{
    static $f = NULL;
    if($f == NULL)
        $f = FullPathOf('');
	if(strpos($full_path, $f) == 0)
	{
		$len = strlen($f);
		return substr($full_path, $len+1);
	}
	return '';
}

//one more base folder
function RelativePathOf2($full_path)
{
    static $len = NULL;
    if($len == NULL)
    {
        $f = dirname(FullPathOf(''));
        $len = strlen($f);
    }   
    return substr($full_path, $len+1);
}


function IsIgnoredFolder($abs_folder_path)
{
    static $ignored_folders = NULL;
    if($ignored_folders == NULL)
    {
        $ifd = Var_IgnoredFolders() ;
        $ifd2 = preg_split('/\|/', $ifd);
        $ifd2[] = SYNC_STAR_DATA_FOLDER;
        $ignored_folders = '';
        foreach($ifd2 as $ff)
        {
            if(strlen(trim($ff)) > 0)
                $ignored_folders .= '|' . strtolower(str_replace("\\", '/', FullPathOf($ff) ));// FullPathOf($ff)
        }
        $ignored_folders .= '|';
    }
    
    $f = '|' . strtolower(str_replace("\\", '/', $abs_folder_path) ) . '|';
    return strpos( $ignored_folders, $f ) !== false;
}


function _________encryption___________(){}


function EncodeFName($s)
{
//	return bin2hex($s);
    global $g_password;
    $ret = AES_Encrypt($g_password, $s);
    return $ret;
}

function DecodeFName($s)
{
    global $g_password;
    $ret = AES_Decrypt($g_password, $s);
    return $ret;
	//return hex2bin2($s);
}

//return true if success, or false if fail
function unlink2($f)
{
	if(file_exists($f))
    {
		unlink($f);	
        return ! file_exists($f);
    }
    return true;
}

function mkdir2($path)
{
	if(! file_exists($path))
	{
		echo "[Create path: $path]";
		mkdir($path, 0777, true);
	}
}

function rrmdir_1($dir) 
{ 
    foreach (scandir($dir) as $f)
    { 
        if ($f == "." || $f == "..")
            continue;
        $file = $dir . '/' . $f;
            
        if(is_dir($file)) 
        {
            if(!IsIgnoredFolder($file))
                rrmdir_1($file); 
        }else 
        {
            SendProgress('Delete file: ' . RelativePathOf($file), false);
            if(! unlink($file))
            {
                chmod($file, 0777);
                unlink($file);
            }
        }
    } 
    if( ! rmdir($dir))
    {
        chmod($dir, 0777);
        rmdir($dir);
    }
}

function rrmdir($dir) 
{
    if(is_dir($dir))
        rrmdir_1($dir);
    if(! is_dir($dir))
        SendProgress('Folder deleted: ' . RelativePathOf($dir), true);
    else 
        SendErrorInfo (err_cannot_del_folder, "Cannot delete folder $dir");
}

// copies files and non-empty directories
function rcopy($src, $dst) 
{
    if (is_dir($src)) 
    {
        mkdir2($dst);
        foreach (scandir($src) as $file)
        {
            if ($file != "." && $file != "..") 
            {
                rcopy("$src/$file", "$dst/$file"); 
            }
        }
    }
    else if (is_file($src)) 
        copy($src, $dst);
}

function MkDirForFile($full_file_name)
{
    mkdir2(  dirname($full_file_name) );
}


function FileExt($file_name)
{
    return pathinfo($file_name, PATHINFO_EXTENSION);
}


function MoveFileToRecycle($full_name)
{
	if(! file_exists($full_name))
		return;
    
	//create recycle folder
	static $path = NULL;
	if($path === NULL)
	{
        global $g_tm_str;
        $path = dirname(__FILE__) . '/' . RECYCLE_NAME . '/' . $g_tm_str[0] . '-' . $g_tm_str[1] . '-'.$g_tm_str[2];
        if(! file_exists($path)) 
        {
            mkdir2($path);
        }
        $path .=  '/' . $g_tm_str[3] . '-' . $g_tm_str[4] . '-'. $g_tm_str[5] . '-' . $g_tm_str[6] . '-';
	}
	//create new name
	$new_name = $path . basename2($full_name);
	rename($full_name, $new_name);
}

function DeleteFileOrFolder($full_name)
{
    static $use_recycle_bin = NULL;
    if($use_recycle_bin === NULL)
    {
        $use_recycle_bin = Var_UseRecycleBin();
    }
    
    if($use_recycle_bin)
        MoveFileToRecycle($full_name);
    if(is_file($full_name))
        unlink2($full_name);
    else if(is_dir($full_name))
        rrmdir ($full_name);
}


function GetZipFileList($zip_file)
{
	$zip_resource = zip_open($zip_file);

	if(is_resource($zip_resource))
	{
		$ret = array();
		while(true)
		{
        	$entry = zip_read($zip_resource);
        	if(! $entry )
        		break;
        	$ret[] = zip_entry_name($entry);
        } 
		zip_close($zip_resource);
	    return $ret;
	}else
	{
		return false;
	}
}

//return number of files extracted, or false
function UnzipFileToFolder($zip_file, $to_folder)
{
	//------------- get file list
	$file_list = GetZipFileList($zip_file);
	$ret = count($file_list);
	if($file_list === false)
	{
		SendErrorInfo(err_general, "Cannot get zip file list: $zip_file");
		return false;
	}
	//------------- move them to recyle
	foreach($file_list as $s)
	{
		$f = $to_folder . '/' . $s;
		DeleteFileOrFolder( $f );
		if(file_exists($f))
        {
			SendErrorInfo(err_general, "Cannot move to recycle: $f");
        }
	}
	//------------- extract new files 
    $zip = new ZipArchive();
	if ($zip->open($zip_file) !== TRUE) 
	{
	    SendErrorInfo(err_general, "Fail to unzip: cannot open zip file $zip_file");
	    return false;
	}
	//------------- extract files 
	$extract_result = $zip->extractTo($to_folder);
	$zip->close();
	//------------- update date time
	$time_info_name = $to_folder . '/' . SYNC_STAR_FILE_TIME;
	
	if(file_exists($time_info_name))
	{
		$ret --;
		$s = file_get_contents($time_info_name);
		$ss = split("\r\n",$s);
		for($i=0;$i<count($ss)-1; $i+=2)
		{
			$full_name = $to_folder . CleanPathName($ss[$i]);
			//echo "touch: $full_name, " . $s[$i+1];	
			if(file_exists($full_name))
				touch($full_name, $ss[$i+1]);		
		}
	}
	//------------- remove time file
	//unlink2($zip_name);
	unlink2($time_info_name);
	if($extract_result)
		return $ret;
	return false;
}

function CreateZip_Addfolders($folder, $zipFile, $exclusiveLength) 
{
	$handle = opendir($folder);
	while ($f = readdir($handle)) 
	{
		if ($f != '.' && $f != '..') {
			$filePath = "$folder/$f";
			// Remove prefix from file path before add to zip.
			$localPath = substr($filePath, $exclusiveLength);
			if (is_file($filePath)) {
				$zipFile->addFile($filePath, $localPath);
			} elseif (is_dir($filePath)) {
				// Add sub-directory.
				$zipFile->addEmptyDir($localPath);
				self::folderToZip($filePath, $zipFile, $exclusiveLength);
			}
		}
	}
	closedir($handle);
}

//files are relative to PathOnServer
function CreateZipByFiles($zip_name, $files, $exclusive_path_len)
{
    $zip = new ZipArchive();
    mkdir2(dirname($zip_name));
	if ($zip->open($zip_name, ZIPARCHIVE::CREATE | ZIPARCHIVE::OVERWRITE)!==TRUE) 
	{
	    SendErrorInfo(err_cannot_create_zip , "Cannot create new zip file: $zip_name");
	}
	if($exclusive_path_len == 0)
		$exclusive_path_len = strlen(FullPathOf('')) + 1;
	$time_info = '';
	foreach($files as $f)
	{
		$src_f = FullPathOf( CleanPathName($f) );
		
		//echo 'Compressing' . substr($src_f, $exclusive_path_len) . "\r\n";
		//flush();
		
		//echo "src=$src_f: ";
		if(is_file($src_f))
			$zip->addFile($src_f, substr($src_f, $exclusive_path_len));
		else if(is_dir($src_f))
		{
			CreateZip_Addfolders($src_f, $zip, $exclusive_path_len) ;
		}
		$time_info .= $f . "\r\n" . filemtime($src_f) . "\r\n";
		//echo "\r\n";
	}
	$zip->addFromString(SYNC_STAR_FILE_TIME, $time_info);
	$extra_msg = '[ZipFileCnt=' . $zip->numFiles . '][Status=' . $zip->getStatusString() . ']';
	SendProgress($extra_msg, false);
	$ret = $zip->close();
	//echo "[ZipClose=$ret]";
}

function SendFileToClient($f, $offset)
{
	$frel = RelativePathOf($f);

	if(! file_exists($f))
	{
		SendErrorInfo(err_file_not_found , "file not found on server: $frel");
	}
	
	//echo file_get_contents($f);
	
//	header("Pragma: public");
//	header("Expires: 0");
//	header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
//	header("Content-Description: File Transfer");
//	header("Content-Type: application/force-download");
//	header("Content-Type: application/octet-stream");
//	header("Content-Type: application/download");
//	header("Content-Disposition: attachment; filename=\"" . $f . "\"");
//	header("Content-Transfer-Encoding: binary");
//	header("Content-Length: ".filesize( $f)); --- with header, it may fail if there are warnings ahead

	// Stream file
	$handle = fopen( $f, 'rb' );
	$chunksize = (200 * 1024); 
	$buffer = '';
	if ($handle === false) 
	{
		SendErrorInfo(err_cannot_open_file, "The file exists, but cannot be opened: $frel");
	}
	//seek to offset
	fseek($handle, $offset);
	$ftm = filemtime($f);
	$fsz = filesize($f);
	
	SendErrorInfo(err_none);
	echo "[FileName=$frel][TimeStamp=$ftm][Offset=$offset][FileSize=$fsz][Content]";
	while (!feof($handle)) 
	{
		$buffer = fread($handle, $chunksize);
		echo $buffer;
		flush();
	}

	// Close file
	fclose($handle);	
}


//no_compress_count starts from zero, and if compression fail, will stop for 5 or 10 times
//data_type is predefined.
function SendDataWithAutoCompress($buffer, $data_type, &$no_compress_count)
{
    //$buffer = fread($handle, $chunksize);
    $buf_len = strlen($buffer);
    if( $no_compress_count <= 0)
    {
        $compressed = gzcompress($buffer,5);
        $compress_len = strlen($compressed);
        if($buf_len > 300) //avoid divided by 0. do not compress if raw data is short
        {
            $ratio = $compress_len / $buf_len;
            if($ratio > 0.95)
            {
                $no_compress_count = 10;
                $compressed = NULL; //give up current compression
            }else if($ratio > 0.8)
                $no_compress_count = 5;
        }else 
            $compressed = NULL; //give up this compression
    }else {
        $no_compress_count --;
        $compressed = NULL;
    }

    if($buf_len > 0) //zero data not allowed
    {
        if($compressed != null)
        {
            echo '[' . DATA_FLAG_COMPRESSED_STREAM . $data_type . ']';
            echo '[BlockSize=' .  (8 + strlen($compressed)) .']';
            echo "\x1f\x8b\x08\x00\x00\x00\x00\x00";//8 bytes compression header
            echo $compressed;
        }else 
        {
            echo '[' . DATA_FLAG_RAW_STREAM . $data_type . ']';
            echo '[BlockSize=' .  strlen($buffer) .']';
            echo $buffer;
        }
    }
}


function SendProgress($progress_str, $force_send)
{
    static $last_time = 0;
    if(time() - $last_time >= 2 || $force_send)
    {
         $last_time = time();
         $no_compress_count = 0;
         SendDataWithAutoCompress($progress_str, DATA_TYPE_PROGRESS, $no_compress_count);
         @ob_flush();
         flush();
    }
}

function SendErrorInfo($error_code, $error_msg="")
{
    $no_compress_count = 0;
    SendDataWithAutoCompress("$error_code|$error_msg", DATA_TYPE_ERROR_CODE, $no_compress_count);
}

/*
 * Output:
 * [FileInfoSize=12][json data][BlockSize=123] binary content 1 [BlockSize=125] binary content 2 ...
 * 
 * Negative BlockSize is compressed
 * If file is missing, then there is not BlockSize
 */
function SendFileWithAutoCompress($full_name, $offset)
{
    //--------- open file --------------
    $handle = is_file($full_name) ? fopen( $full_name, 'rb' ) : false;
    //--------- send file info in json --------------
	$send_name = RelativePathOf($full_name);
	$file_info['Name'] = EncodeFName($send_name);
    if($handle === false)
    {
        SendErrorInfo(err_general, "Cannot open file $send_name");
        //$file_info['IsMissing'] = '1';
        return;
    }else 
    {
        $file_info['Length'] = filesize($full_name);
        $file_info['TimeStamp'] = filemtime($full_name);
        $file_info['Offset'] = $offset;
    }
    $s_file_info = json_encode($file_info);
//echo ('1234');
//exit;
    //echo  '[' . DATA_TYPE_FILE_INFO  .  '][BlockSize=' . strlen($s_file_info) .']' .  $s_file_info;
    $no_compress_count1 = 0;//auto compress
    SendDataWithAutoCompress($s_file_info, DATA_TYPE_FILE_INFO, $no_compress_count1);
    if($handle === false)
        return;
    //--------- send file info in json --------------
	fseek($handle, $offset);
    $chunksize = (32 * 1024); 
    //--------- send file content --------------
    $no_compress_count2 = 0;//auto compress
	while (!feof($handle)) 
	{
		$buffer = fread($handle, $chunksize);
        SendDataWithAutoCompress($buffer, DATA_TYPE_FILE_CONTENT, $no_compress_count2);
	}

	// Close file
	fclose($handle);	
}

function SendContentOfFolder($directory, $recursive)
{
    //do not automatically "enter" the system data folder
    //if($directory == FullPathOf( SYNC_STAR_DATA_FOLDER ))
    //    return;
    if(IsIgnoredFolder($directory))
        return; 
    
    $no_compress_count = 0;
    SendDataWithAutoCompress(EncodeFName( RelativePathOf($directory) ), DATA_TYPE_FOLDER, $no_compress_count);
    if (is_dir($directory) && ($handle = opendir($directory))!= 0) 
    {
        while (false !== ($file = readdir($handle))) 
        {
            if ($file != "." && $file != "..") 
            {
                if (is_dir($directory. "/" . $file)) 
                {
                    if($recursive) 
                    {
                        SendContentOfFolder($directory. "/" . $file, $recursive);
                    }
                } else 
                {
                    //do not automatically send "myself"
                    if($directory . "/" . $file != __FILE__)
                        SendFileWithAutoCompress($directory . "/" . $file, 0);
                }
            }
        }
        closedir($handle);
    }
}


 
function Password_Load($return_only = false)
{
    $f = FullPathOf(USER_INFO_FILE);
    if(is_file($f))
    {
        $s = hex2bin2( file_get_contents($f) );
        if($return_only)
            return $s;
        $GLOBALS['g_password'] = $s;
    } 
}

function Password_Save($new_pwd)
{
    $f = FullPathOf(USER_INFO_FILE);
    MkDirForFile( $f );

    file_put_contents($f, bin2hex($new_pwd));
}


function ___________rcv_files_________(){}
/*
 * array (
  'name' => '<trail.d218f5c3-74a5-4eac-b40d-189ef85ada04.swf|trailer_008.swf|9773435|1354547110|raw',
  'type' => 'application/octet-stream',
  'tmp_name' => 'D:\\wamp\\tmp\\php9DE9.tmp',
  'error' => 0,
  'size' => 10,
  '_unique_tmp_name' => '<trail.d218f5c3-74a5-4eac-b40d-189ef85ada04.swf',
  '_name' => 'trailer_008.swf',
  '_size' => '9773435',
  '_time_stamp' => '1354547110',
  '_is_compressed' => false,
)-

 *  */


//return error msg
function RFWAZ_MoveFileTo($src_full_path, $dest_full_name, $expected_size)
{
    //fail if src not found
    if( ! file_exists($src_full_path))
        return 'File not found: ' . $src_full_path;
    //move dest to recycle
    DeleteFileOrFolder($dest_full_name);
    //remove dest
    unlink2($dest_full_name);
    if(file_exists($dest_full_name))
        return 'File cannot be deleted: ' . $dest_full_name;
    MkDirForFile($dest_full_name);
    //do the actual move
    rename($src_full_path, $dest_full_name);
    
    if( ! file_exists($dest_full_name))
        return 'File cannot be moved to: ' . $dest_full_name;
    
    $size = filesize($dest_full_name);
    if($size  != $expected_size)
        return "File size mismatch, expected $expected_size, real $size";
    
    return NULL;
}



//Doc: #20121213
//return error message
function ReceiveFilesWithAutoZip(&$warning_count, &$save_count)
{
    $warning_count = 0;
    $save_count = 0;
    $_FILES[0]['name'] = DecodeFName($_FILES[0]['name']);
    //var_export($_FILES[0]);
    
    $unique_file_name = FullPathOf( BULKY_FOLDER . '/' . $_FILES[0]['name'] );
    
    $unique_handle = NULL;//fopen($unique_file_name, 'a'); 
    $tmp_handle = fopen($_FILES[0]['tmp_name'],'r');//append to current unique file
    
    
    if(strlen($_FILES[0]['tmp_name']) < 1)
    {
    	return "Uploaded file not found. \r\nPlease change php.ini, set and upload_max_filesize and post_max_size to at least 5M";
    }
    

    
    $err_msg = NULL;
    while($err_msg == NULL)
    {
        //--------- get flag and length ------------
        $s = fread($tmp_handle, 11);
        if($s === FALSE || strlen($s) <= 0) //end of file
            break;
        if(strlen($s) != 11)
        {
            $err_msg = "Invalid stream format";
            break;
        }
            
        //--------- get flag  ------------
        $data_flag = $s[1];
        if($s[0]!= '[' || $s[10] != ']')
        {
            $err_msg = 'Invalid compressed format, size not found]';
            break;
        }
        //--------- get length  ------------
        $len = str_replace(' ','', substr($s,2,8));
        if($len > 0)
        {
            //--------- read data  ------------
            $bin_data = fread($tmp_handle, $len);
            if(strlen($bin_data) != $len)
            {
                $err_msg = 'Trying to read ' . $len .' bytes, but only ' . strlen($bin_data) . ' bytes loaded';
                break;
            }
            
            if($unique_handle === NULL && ($data_flag == DATA_FLAG_RAW_STREAM || $data_flag == DATA_FLAG_COMPRESSED_STREAM))
            {
                MkDirForFile($unique_file_name);
                $unique_handle = fopen($unique_file_name, 'a'); 
            }

            if($data_flag == DATA_FLAG_RAW_STREAM)
            {
                fwrite($unique_handle, $bin_data);
            //-------- decompress ------------
            }else if($data_flag == DATA_FLAG_COMPRESSED_STREAM)
            {
            	$bin_data_old_len = strlen($bin_data);
                $bin_data = gzinflate($bin_data);
                $bin_data_len = strlen($bin_data);
                //the last 5 bytes should be [123]
                $p = substr($bin_data,-5);
                if(strlen($p) != 5)
                {
                    $err_msg = 'Compressed buffer too small. Size changed from ' . $bin_data_old_len . ' to ' . $bin_data_len;
                    break;
                }
                if(strcmp($p , '[123]') != 0 )
                {
                    $err_msg = "\r\n\r\nInvalid compressed data\r\n\r\n";
                    break;
                }else 
                    $bin_data_len -= 5;
                
                fwrite($unique_handle, $bin_data, $bin_data_len);
            //------------ save to file --------------------
            }else if($data_flag == DATA_TYPE_FILE_INFO)
            {
                $ss = preg_split('/\|/', $bin_data) ;
                $_unique_tmp_name = $ss[0]; 
                $_file_name = DecodeFName( $ss[1] ); 
                $_file_size = $ss[2]; 
                $_time_stamp = $ss[3]; 
                
                if($_unique_tmp_name != $_FILES[0]['name'])
                {
                    $err_msg = "Unique file name does not match";
                    break;
                }
                if($unique_handle !== NULL) fclose($unique_handle);  $unique_handle =  NULL; //close tmp file
                $dest_file_name = FullPathOf($_file_name);
    
                $msg = NULL;
                MkDirForFile($dest_file_name);//this is for "touch" which will create empty file.
                if(file_exists($unique_file_name) || $_file_size > 0)
                    $msg = RFWAZ_MoveFileTo(  $unique_file_name, $dest_file_name, $_file_size);
                touch($dest_file_name, $_time_stamp);//touch will create empty file
                DirChange_Save($dest_file_name);
                if($msg != NULL)
                {
                    $warning_count++;
                    //echo "[Warning=<$_file_name>: $msg]\r\n";
                    SendErrorInfo(err_general, "$_file_name: $msg");
                }else 
                {
                    //echo "[Saved=<$_file_name>]\r\n";
                    $save_count ++;
                }
                
                unlink2($unique_file_name);//next file will be a fresh start
            }else if($data_flag == DATA_TYPE_FOLDER)
            {
                $ss = preg_split('/\|/', $bin_data) ;
                $dest_file_name = FullPathOf( DecodeFName( $ss[1] ) ); 
                mkdir2($dest_file_name);
                DirChange_Save($dest_file_name);
            }
        }
    }
    fclose($tmp_handle);
    if($unique_handle !== NULL)
    {
        fclose($unique_handle);
        if(file_exists($unique_file_name))
        {
            //echo '[TmpFileSize=' . filesize($unique_file_name) . ']';
        }
    }
    
    return $err_msg;   
}



function _________FileNode______________(){}

//http://stackoverflow.com/questions/1474377/json-library-for-c-sharp
//http://jsonformatter.curiousconcept.com/
function CreateFileNode($file_name, $sub_folders, $is_folder = false)
{
	$ret = array();

	if(substr($file_name,0,1) == '*')
	{
		$length = 0;
		$time_stamp = 0;
		$ret['Name'] = substr($file_name,1);//the root folder, contains the full folder info
		$ret['IsFolder'] = true;
	}else
	{
		//echo ' file: ' . $file_name . '<br/>';
        if(file_exists($file_name))
        {
            $length = filesize($file_name);
            $time_stamp = filemtime($file_name);
        }else 
        {
            $length = -1;
            $time_stamp = 0;
        }
		$ret['Name'] = basename2($file_name);
		$ret['IsFolder'] = ($sub_folders != NULL) || $is_folder;
		//$ret['MD5'] = md5_file($file_name);
	}
	
	$ret['Length'] = $length;
	$ret['TimeStamp'] = $time_stamp;
	$ret['SubFolders'] = $sub_folders;
	
	//$s = $ret['Name'];
	//$s = mb_convert_encoding($s,'UTF-8','CP936');
	//$s = urlencode($s);
	$ret['Name'] = EncodeFName($ret['Name']);// $s;
	
	return $ret;
}


function DirectoryToArray_Internal($directory, $recursive, $exclude_folder_name) 
{
    if($recursive)
    {
        global $dir_count;
        $dir_count++;
        SendProgress("Search folder($dir_count): " . RelativePathOf2( $directory ), false);
    }
    $array_items = array();
    if (file_exists($directory) && ($handle = opendir($directory))!= 0) 
    {
        while (false !== ($file = readdir($handle))) 
        {
            if ($file != "." && $file != "..") 
            {
                if (is_dir($directory. "/" . $file)) 
                {
                	if($file != $exclude_folder_name && ! IsIgnoredFolder( $directory. "/" . $file ))
                	{
	                    $sub = array();
	                    if($recursive) 
	                    {
	                        $sub = DirectoryToArray_Internal($directory. "/" . $file, $recursive, $exclude_folder_name);
	                    }
	                    $array_items[] = CreateFileNode($directory . "/" . $file, $sub, true);//preg_replace("/\/\//si", "/", $file);
                	}
                } else 
                {
                    $file = $directory . "/" . $file;
                    $array_items[] = CreateFileNode($file, NULL);//preg_replace("/\/\//si", "/", $file);
                    //echo json_encode( $file) . "\r\n" . $file . "\r\n";
                }
            }
        }
        closedir($handle);
    }
    return $array_items;
}

function DirectoryToArray($directory, $recursive, $exclude_folder_name) 
{
    global $dir_count;
    $dir_count = 0;
    $ret = DirectoryToArray_Internal($directory, $recursive, $exclude_folder_name) ;
    
    if($recursive)
        SendProgress("Total $dir_count folder(s).", true);
    
    return $ret;
}


global $_changed_dir_list;
$_changed_dir_list = array();
function DirChange_AddChange($change_type, $path1, $path2)
{
    global $_changed_dir_list;
    $ch = array();
    $ch['ChangeType'] = $change_type;
    
    $ch['DirName1'] = EncodeFName(RelativePathOf(dirname($path1)));
    if(is_dir ($path1))
        $ch['FileNode1'] = CreateFileNode($path1, NULL, true);
    else 
        $ch['FileNode1'] = CreateFileNode($path1, NULL, false);
        
    if($path2 != NULL)
    {
        $ch['DirName2'] = EncodeFName(RelativePathOf(dirname($path2)));
        if(is_dir ($path2))
            $ch['FileNode2'] = CreateFileNode($path2, NULL, true);
        else 
            $ch['FileNode2'] = CreateFileNode($path2, NULL, false);
    }
    $_changed_dir_list[]= $ch;
}

function DirChange_Delete($full_path_of_file)
{
    clearstatcache ();//true, $full_path_of_file);
    DirChange_AddChange(DIR_CHANGE_DELETE, $full_path_of_file, NULL);
}
function DirChange_Save($full_path_of_file)
{
    clearstatcache ();//true, $full_path_of_file);
    DirChange_AddChange(DIR_CHANGE_SAVE, $full_path_of_file, NULL);
}
function DirChange_Rename($full_path_from, $full_path_to)
{
    clearstatcache ();//true, $full_path_from);
    //clearstatcache (true, $full_path_to);
    DirChange_AddChange(DIR_CHANGE_RENAME, $full_path_from, $full_path_to);
}

//called on exit, installed by function register_shutdown_function
function DirChange_Send()
{
    global $_changed_dir_list;
    if(count($_changed_dir_list) > 0)
    {
        echo '[DirChangeData]'; //client will use this to remove binary data
        //echo '[Content]';
        
        $root = array();
        $root['Changes'] = $_changed_dir_list;
        
        $buffer = json_encode($root);
        $no_compress_count = 0;
        SendDataWithAutoCompress($buffer, DATA_TYPE_DIR_CHANGE, $no_compress_count);
    }
}

register_shutdown_function('DirChange_Send');

function ________backup_sql__________(){}
/*
  if $msg not null, added to buffer
  if $msg is null, return the buffer
*/
function log_msg($msg)
{
    static $total_msg = NULL;
    if($msg == NULL) 
        return $total_msg;
    
    if($total_msg == NULL)
        $total_msg = $msg . "\r\n";
    else 
        $total_msg .= $msg . "\r\n";
}


function ExDB_Quote($a_name)
{
	//Add backqouotes to tables and db-names in
	//SQL queries. Taken from phpMyAdmin.
    if (!empty($a_name) && $a_name != '*') {
        if (is_array($a_name)) {
             $result = array();
             reset($a_name);
             while(list($key, $val) = each($a_name)) {
                 $result[$key] = '`' . $val . '`';
             }
             return $result;
        } else {
            return '`' . $a_name . '`';
        }
    } else {
        return $a_name;
    }
} 

//Reads the Database table in $table and creates
//SQL Statements for recreating structure and data
function ExDB_ExportOneDBTable($table, $db_connect)
{
		$sql_statements  = "";

		// Add SQL statement to drop existing table
		$sql_statements .= "\n";
		$sql_statements .= "\n";
		$sql_statements .= "#\n";
		$sql_statements .= "# Delete any existing table " . ExDB_Quote($table) . "\n";
		$sql_statements .= "#\n";
		$sql_statements .= "\n";
		$sql_statements .= "DROP TABLE IF EXISTS " . ExDB_Quote($table) . ";\n";

		// Table structure

		// Comment in SQL-file
		$sql_statements .= "\n";
		$sql_statements .= "\n";
		$sql_statements .= "#\n";
		$sql_statements .= "# Table structure of table " . ExDB_Quote($table) . "\n";
		$sql_statements .= "#\n";
		$sql_statements .= "\n";

        mysql_query('SET NAMES "utf8"');        
		// Get table structure
		$query = "SHOW CREATE TABLE " . ExDB_Quote($table);
		$result = mysql_query($query, $db_connect);
		if ($result == FALSE) {
			log_msg(": Error getting table structure of $table!", 20);
			log_msg("          " . mysql_errno() . ": " . mysql_error() , 20);
		} else {
			if (mysql_num_rows($result) > 0) {
				$sql_create_arr = mysql_fetch_array($result);
				$sql_statements .= $sql_create_arr[1];
			}
			mysql_free_result($result);
			$sql_statements .= " ;";
		} // ($result == FALSE)

		// Table data contents

		// Get table contents
		$query = "SELECT * FROM " . ExDB_Quote($table);
		$result = mysql_query($query, $db_connect);
		if ($result == FALSE) {
			log_msg(": Error getting records of $table!", 30);
			log_msg("          " . mysql_errno() . ": " . mysql_error() , 30);
		} else {
			$fields_cnt = mysql_num_fields($result);
			$rows_cnt   = mysql_num_rows($result);
		} // if ($result == FALSE)

		// Comment in SQL-file
		$sql_statements .= "\n";
		$sql_statements .= "\n";
		$sql_statements .= "#\n";
		$sql_statements .= "# Data contents of table " . $table . " (" . $rows_cnt . " records)\n";
		$sql_statements .= "#\n";

		// Checks whether the field is an integer or not
		for ($j = 0; $j < $fields_cnt; $j++) {
			$type          = mysql_field_type($result, $j);
			if ($type == 'tinyint' || $type == 'smallint' || $type == 'mediumint' || $type == 'int' ||
				$type == 'bigint'  /*|| $type == 'timestamp'*/) {
				$field_num[$j] = TRUE;
			} else {
				$field_num[$j] = FALSE;
			}
		} // end for

		// Sets the scheme
		$entries = 'INSERT INTO ' . ExDB_Quote($table) . ' VALUES (';
		$search			= array("\x00", "\x0a", "\x0d", "\x1a"); 	//\x08\\x09, not required
		$replace		= array('\0', '\n', '\r', '\Z');
		$current_row	= 0;
		while ($row = mysql_fetch_row($result)) {
			$current_row++;
			for ($j = 0; $j < $fields_cnt; $j++) {
				if (!isset($row[$j])) {
					$values[]     = 'NULL';
				} else if ($row[$j] == '0' || $row[$j] != '') {
					// a number
					if ($field_num[$j]) {
						$values[] = $row[$j];
					}
					else {
                        $_s = ExDB_AddSlashes($row[$j]);
						$values[] = "'" . str_replace($search, $replace, $_s) . "'";
					} //if ($field_num[$j])
                } else {
					$values[]     = "''";
				} // if (!isset($row[$j]))
			} // for ($j = 0; $j < $fields_cnt; $j++)
			$sql_statements .= " \n" . $entries . implode(', ', $values) . ') ;';
			unset($values);
		} // while ($row = mysql_fetch_row($result))
		mysql_free_result($result);

		// Create footer/closing comment in SQL-file
		$sql_statements .= "\n";
		$sql_statements .= "#\n";
		$sql_statements .= "# End of data contents of table " . $table . "\n";
		$sql_statements .= "# --------------------------------------------------------\n";
		$sql_statements .= "\n";
		return $sql_statements;
} 

function ExDB_AddSlashes($a_string = '', $is_like = FALSE)
{
	/*
		Better addslashes for SQL queries.
		Taken from phpMyAdmin.
	*/
    if ($is_like) {
        $a_string = str_replace('\\', '\\\\\\\\', $a_string);
    } else {
        $a_string = str_replace('\\', '\\\\', $a_string);
    }
    $a_string = str_replace('\'', '\\\'', $a_string);

    return $a_string;
} // function ExDB_AddSlashes($a_string = '', $is_like = FALSE)


//return number of errors
function ExDB_ExportDatabase($db_name, $db_user, $db_pass , $db_backup_full_path)
{
    if( ! unlink2($db_backup_full_path))
    {
        log_msg("Could not delete old file: $db_backup_full_path");
        return 1;
    }
    // Get configuration options for this database
    $db_host = 'localhost';


    // Reset error counter for this database
    $db_error_count = 0;

    log_msg("Backup database $db_name ... ");
    log_msg("MySQL Server: " . $db_host );
    log_msg("MySQL User: " . $db_user);

    //------------------------  connect to db server ------------------------
    log_msg("Backup database ...");
    if ( ($db_connect = @mysql_pconnect($db_host, $db_user, $db_pass) ) !== false) 
    {
        //mysql_set_charset('utf-8');
        //------------------------  open database ------------------------
        if ( ($success = mysql_select_db($db_name, $db_connect)) !== false)
        {
            global $g_tm_str;
            //------------------------  get table list ------------------------
            $tables = mysql_list_tables($db_name);
            // Header information in SQL-file
            $sql_file  = "# MySQL database backup\r\n";
            $sql_file .= "# Vesion 1.00 \r\n";
            $sql_file .= "# Generated: {$g_tm_str[0]}-{$g_tm_str[1]}-{$g_tm_str[2]} {$g_tm_str[3]}:{$g_tm_str[4]}:{$g_tm_str[5]}\r\n";// date("l j. F Y H:i T") . "\r\n";
            $sql_file .= "# Hostname: " . $db_host . "\r\n";
            $sql_file .= "# MySQL Server: " . mysql_get_host_info() . "\r\n";
            $sql_file .= "# MySQL Server version: " .  mysql_get_server_info() . ', ' . mysql_get_client_info() . "\r\n";
            $sql_file .= "# Database: " . ExDB_Quote($db_name) . "\r\n";
            $sql_file .= "# " . mysql_num_rows($tables) . " tables found.\r\n";
            //$sql_file .= "# --------------------------------------------------------\r\n\r\n";
            //$sql_file .= "USE $db_name;\r\n\r\n";
            //$sql_file .= "# --------------------------------------------------------\r\n";

            
            $msg_table_list = '';
            //------------------------  backup table by table ------------------------
            for ($i = 0; $i < mysql_num_rows($tables); $i++) 
            {
                $curr_table = mysql_tablename($tables, $i);
                $_i = $i+1; $msg_table_list .=   ($i > 0? ', ' : '') . "({$_i}) $db_name.$curr_table";

                // Increase script execution time-limit to 15 min for every table.
                if ( !ini_get('safe_mode')) @set_time_limit(15*60);

                // Create the SQL statements
                $sql_statements = ExDB_ExportOneDBTable($curr_table, $db_connect);

                $sql_file .= "# --------------------------------------------------------\n";
                $sql_file .= "# Table: " . ExDB_Quote($curr_table) . "\n";
                $sql_file .= "# --------------------------------------------------------\n";
                $sql_file .= $sql_statements;
            } //for each table

            // save to file
            MkDirForFile($db_backup_full_path);
            if(($fp = fopen($db_backup_full_path,'w')) !== false)
            {
                fwrite($fp, UTF8_HEADER);//utf8 header
                fwrite($fp, $sql_file);
                fclose($fp);
                //log_msg("Saved tables: $msg_table_list.\r\n** Success** Backup of database $db_name finished.\r\n");
            }else 
            {
                log_msg("Could not create file $db_backup_full_path");
                $db_error_count++;
            }
        }else  //db opened
        {
            log_msg("Could not select database $db_name:\n          " . mysql_error());
            $db_error_count++;
        }
    }else  //connect to db server
    {
        log_msg("Could not connect to MySQL server!\n           " . mysql_error());
        $db_error_count++;
    }
    $size = file_exists($db_backup_full_path) ? filesize($db_backup_full_path) : 0;
    log_msg("Backup for database $db_name($size bytes) completed with $db_error_count errors.");
    return $db_error_count;
}


//return number of errors
function ExDB_ImportDatabase($db_name, $db_user, $db_pass , $db_backup_full_path)
{
    $error_count = 0;
    function _PrintErrorInfo($dbh, &$error_count, $line)
    {
        static $last_msg = NULL;
        $ei = $dbh->errorInfo();
        if(isset($ei[2]) && $ei[2] != $last_msg)
        {
            $last_msg = $ei[2];
            $error_count++;
            log_msg("Error ($line): $last_msg"); 
        }
    }
    
    $s = file_get_contents($db_backup_full_path);
    if(substr($s,0,3) == UTF8_HEADER)
        $s = substr($s, 3);     
    try
    {
        $dbh = new PDO('mysql:host=localhost', $db_user, $db_pass, 
                array(
                    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
                    PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => true
                )
               );
        $dbh->setAttribute(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY, true);
              //CREATE USER '$db_user'@'localhost' IDENTIFIED BY '$db_pass';
        $ret = $dbh->query("CREATE DATABASE IF NOT EXISTS `$db_name`;
                    GRANT ALL PRIVILEGES ON `$db_name` TO '$db_user'@'localhost';
                    FLUSH PRIVILEGES;") ;
        _PrintErrorInfo($dbh, $error_count, __LINE__);
        if(is_object($ret))
            $ret->closeCursor();
        
        $ret3 = $dbh->query("USE `$db_name`");
        if(is_object($ret3))
            $ret3->closeCursor();
        
        _PrintErrorInfo($dbh, $error_count, __LINE__);
        $pos = 0;
        $matches = 0;
        $total_len = strlen($s);
        while(true)
        {
            $found = preg_match('/; *[\r\n]/', $s, $matches, PREG_OFFSET_CAPTURE, $pos+1);//+100*1024);
            if($found === 1)
            {   
                $sql = substr($s, $pos, $matches[0][1] - $pos+1);
                $pos = $matches[0][1] + strlen($matches[0][0]);
            }else 
            {
                $sql = substr($s, $pos);
                $pos = $total_len;
            }
            $sql = trim($sql);
            if(strlen($sql) > 0)
            {
                $ret2 = $dbh->query($sql);
                if(is_object($ret2))
                    $ret2->closeCursor();
                _PrintErrorInfo($dbh, $error_count, __LINE__ . ',' . $pos .'/'.$total_len);
            }
            //send progress
            SendProgress("Restore database|$pos|$total_len", ! $found);
            if($found <= 0)
                break;
        }
    }catch(PDOException  $ex)
    {
        $error_count++;
        log_msg('Error in PDO: ' .  $ex->getMessage());
    }
    return $error_count;
}
    

function ________cmd_list___________(){}


//----------- Check version --------------
function Cmd_CheckVersion()
{
    if($GLOBALS['g_invalid_pwd'])
    {
        SendErrorInfo(err_invalid_pwd, 'Invalid password');
        return false;
    }
    $ver = Var_ClientVersion();
	if($ver == CLIENT_VERSION)
        return true;
    
    if($ver !== false)
	{
		SendErrorInfo(err_invalid_client_version , "Client version $ver found, expected version " . CLIENT_VERSION );
		exit ;
	}
    
    return false;
}

//----------- list folder --------------
function Cmd_ListFolder()
{
    function RemoveMyself(&$sub)
    {
        $self_name = EncodeFName(basename2(__FILE__));
        $cnt = count($sub);
        for($i=0;$i<$cnt;$i++)
        {
            if($sub[$i]['Name'] == $self_name)
            {
                unset($sub[$i]);
                $sub = array_values($sub);
                break;
            }
        }
    }
    
    function CreateHTAccess()
    {
        //Deny from all
        $f = FullPathOf( SYNC_STAR_DATA_FOLDER . '/.htaccess');
        if(! is_file($f))
        {
            MkDirForFile($f);
            file_put_contents($f, "Deny from all\r\n");
        }
    }
    
	if(VarCmd_ListFolder() !== FALSE)
	{
        CreateHTAccess();
		$folder = VarCmd_ListFolder();
		$folder = dirname(__FILE__) . CleanPathName($folder);
		//if(! file_exists($folder))
		//	return json_encode(array('Ret'=>'1','Msg'=>'Folder not found:'+$folder));
		
		$sub = DirectoryToArray($folder, true, '');
        
        RemoveMyself($sub);//this server php file will not appear
        
        SendErrorInfo(err_none, "");
		echo '[Content]' . "\x1f\x8b\x08\x00\x00\x00\x00\x00" .  gzcompress(json_encode(CreateFileNode('*'.$folder,$sub)),5);
		
		//file_put_contents("r:\\3.txt",json_encode(CreateFileNode('*'.$folder,$sub)));
		exit;
	}
} 

//---------- rename file ---------------
function Cmd_RenameFile()
{
    function RenameOneFile($old_name, $new_name)
    {
		if( ! file_exists($old_name))
		{
			SendErrorInfo( err_cannot_rename_missing_src, "Rename failed: source file not found: $old_name");
			return false;
		}
		if( file_exists($new_name))
		{
			SendErrorInfo(err_cannot_rename_dest_exists, "Rename failed: destination file already exists: $new_name");
			return false;
		}
        MkDirForFile($new_name);
		if(rename($old_name, $new_name))
		{
			SendProgress("File named from ($old_name) to ($new_name)", false);
            return true;
		}else
        {
			SendErrorInfo(err_fail_to_rename , "Fail to named from ($old_name) to ($new_name)");
            return false;
        }
    }
    
	if(VarCmd_Rename() !== FALSE) 
	{
        $old_names = preg_split('/\|/', VarCmd_Rename());
        $new_names = preg_split('/\|/', Var_RenameTo());
        if(count($old_names) != count($new_names))
        {
            exit ('[Ret=10][Msg=Invalid parameter: from-to pair does not match]');
        }
        $len = count($old_names);
        $err_cnt = 0;
        for($i=0;$i<$len;$i++)
        {
            $old_name = FullPathOf( $old_names[$i] );
            $new_name = FullPathOf( $new_names[$i] );
            if(RenameOneFile($old_name, $new_name) === false)
                $err_cnt++;
            
            DirChange_Rename($old_name, $new_name);
        }
		
        if($err_cnt == 0)
        {
            SendErrorInfo(err_none);
        }else {
            SendErrorInfo(err_general, "FailCnt=$err_cnt");
        }
		exit;
	}
}

//----------- file operation: delete ---------------

function Cmd_DeleteFile()
{
    //input: relative_path
    function DeleteOneFile($nrel)
    {
		$name = FullPathOf( $nrel );
		if(! file_exists($name))
		{
			SendErrorInfo( err_none, "No need to delete, file does not exist:$nrel");
            return true;
		}
		DeleteFileOrFolder($name);
		if(is_file($name))
		{
			SendErrorInfo( err_general, "Cannot delete file: $nrel");
            return false;
		}else if(is_dir($name))
		{
			SendErrorInfo( err_general, "Cannot delete folder: $nrel");
            return false;
		}else
        {
			SendErrorInfo( err_none, "File deleted: $nrel");
            return true;
        }
    }
    
	if(VarCmd_Delete() !== FALSE)
	{
        $names = preg_split('/\|/', VarCmd_Delete());
        $err_cnt = 0;
        foreach($names as $n)
        {
            if( ! DeleteOneFile($n))
                $err_cnt ++;
            
            DirChange_Delete( FullPathOf( $n ) );
        }
        if($err_cnt == 0)
        {
            SendErrorInfo(err_none);
        }else 
        {
            SendErrorInfo(err_general, "ErrCount=$err_cnt");
        }
                
		exit;
	}
}


function SaveUploadedFile($uploaded_index, $save_to_name, $mtime)
{
	$full_name = FullPathOf( $save_to_name );

	$path = dirname($full_name);
	if(! file_exists($path))
		mkdir2($path);
	//move old to recycle
	DeleteFileOrFolder($full_name);
		
	unlink2($full_name);
	if(! file_exists($full_name))
	{
		$tmp = $_FILES['file' . $uploaded_index]['tmp_name'];
		if(file_exists($tmp))
			rename($tmp, $full_name);
		else
			echo "[Msg=Tmp file not found]";
		if(file_exists($full_name))
		{
			$size = filesize($full_name);
			touch($full_name, $mtime);
            //if there is only one file, do not show index
			$u = ($uploaded_index == 0) ? "" : $uploaded_index;
			echo "[FileName$u=$full_name][FileSize$u=$size][Msg$u=Uploaded]";
			return true;
		}else
			echo "[Msg=Cannot save to this file][FileName=$full_name]";
	}else
		echo "[Msg=Cannot delete the old file][FileName=$full_name]";
	return false;
}

function Cmd_UploadZippedFile()
{
	if(VarCmd_UploadZipped() !== FALSE)
	{
		$zip_name = $_FILES['file0']['tmp_name'];
		$unzip_count = UnzipFileToFolder($zip_name, FullPathOf(''));
		$size = filesize($zip_name);
		unlink2($zip_name);
		
		if($unzip_count > 0)
        {
			SendErrorInfo(err_none, "Uploaded $zip_name, size $size, $unzip_count files uploaded");
        }
        else
        {
			SendErrorInfo(err_unzip_partly_fail , "Some files are not successfully unzipped");
        }
		exit;
	}
}

function Cmd_UploadAutoZip()
{
    if(VarCmd_UploadAutoZip() !== false)
	{
        $warning_count = $save_count = 0;
        $err_msg = ReceiveFilesWithAutoZip($warning_count, $save_count);
        
        if($warning_count == 0 && $err_msg == NULL)
        {
            SendErrorInfo(err_none, "$save_count file saved.");
        }else 
        {
            $err = $err_msg . ',';
            if($err_msg == '')
                $err = '';
            SendErrorInfo(err_general, "There are errors: {$err}WarningCount=$warning_count, SaveCount=$save_count");
            //echo "[Ret=200][Error=$err_msg][SaveCount=$save_count][WarningCount=$warning_count]";
        }
		exit;
	}
}



//----------- compress and download files -----------------
//files are divided by |
function Cmd_DownloadZipped()
{
	if(VarCmd_DownloadZipped() !== false)
	{
		$filestr = VarCmd_DownloadZipped();
		//files divided by |
		//echo var_export($filestr, true);
		//$files = split('\|', $filestr);
        
        $files = preg_split('/\|/', $filestr) ;
        
		//open the zip file
		$zip_name = FullPathOf( TEMP_ZIP_FILE );
		unlink2($zip_name);	
		if(file_exists($zip_name))
		{
			SendErrorInfo(err_general , "Cannot delete file: $zip_name");
            exit;
		}
		CreateZipByFiles($zip_name, $files, 0);
		
		SendFileToClient($zip_name,0);
		unlink2($zip_name);	
		exit;
	}
}


function Cmd_DownloadAutoZip()
{
	if(VarCmd_DownloadAutoZip() !== false)
	{
		$filestr = VarCmd_DownloadAutoZip();
		//files divided by |
		//$files = split('\|', $filestr);
        $files = preg_split('/\|/', $filestr) ;

        $offset = Var_DownloadOffset();
		if($offset === false) 
			$offset = 0;

        $error_count = 0;
		foreach($files as $f)
        {
            $full_name = FullPathOf($f);
            if(is_file($full_name))
            {
                SendFileWithAutoCompress($full_name, $offset );
            }
            else if(is_dir($full_name))
            {
                SendContentOfFolder($full_name, true);
            }else 
            {
                $error_count ++;
                SendErrorInfo(err_general, "Cannot find file $full_name");
            }
            $offset = 0;//offset works for the first file only.
        }
        if($error_count == 0)
            SendErrorInfo(err_none, 'Downloading ' . count($files) . " files, offset=$offset");
		exit;
	}
}


//---------- download file ---------------
function Cmd_DownloadFile()
{
	if(VarCmd_DownloadFile() !== false) 
	{
		$file_name = VarCmd_DownloadFile();
			
		$f = FullPathOf( $file_name );

	
		$offset = Var_DownloadOffset();
		if($offset === false) 
			$offset = 0;

		SendFileToClient($f, $offset);
	
		exit;
	} 
}

function Cmd_BackupDatabase()
{
    function _GetDBInfoFromWPConfig(&$db_name, &$db_user, &$db_pass)
    {
        $f = dirname(__FILE__) . '/wp-config.php';
        if( ! is_file($f))
            $f = FullPathOf ('wp-config.php');
        if( is_file($f))
        {
            $s = file_get_contents($f);
            //define('DB_NAME', 'abcd');
            $ss = token_get_all($s);
            
            $wait_for  = '';
            foreach($ss as $token)
            {
                if(isset($token[0]) && $token[0] == T_CONSTANT_ENCAPSED_STRING)
                {
                    $t = trim($token[1],$token[1][0]);
                    if($wait_for != '')
                    {
                        if($wait_for ==  'user') $db_user = $t;   
                        else if($wait_for == 'db_name')  $db_name = $t; 
                        else if($wait_for == 'db_pwd') $db_pass = $t;
                        $wait_for = '';
                    }else 
                    {
                        if($t == 'DB_USER') $wait_for = 'user';
                        else if($t == 'DB_NAME') $wait_for = 'db_name';
                        else if($t == 'DB_PASSWORD') $wait_for = 'db_pwd';
                    }
                }
            }
        }
    }
    
    if(VarCmd_BackupDB() !== false)
    {
        $db_name = Var_DBName();//'headtax';
        $db_user = Var_DBUser();//'root';
        $db_pass = Var_DBPwd();//'';
        $db_backup_full_path = FullPathOf(  Var_DBFileRelPath() );
        
        
        if( strlen($db_name) <= 0 )
        {
            log_msg('Get configuration from wp-config.php');
            _GetDBInfoFromWPConfig($db_name, $db_user, $db_pass);
            //echo $db_name . ',' . $db_user .','. $db_pass . ' ';
        }
        
        if(ExDB_ExportDatabase($db_name, $db_user, $db_pass, $db_backup_full_path) == 0)
        {
            SendErrorInfo(err_none);
        }else 
        {
            SendErrorInfo(err_general, log_msg(NULL));
        }
        DirChange_Save($db_backup_full_path) ;
        exit;
    }
}

function Cmd_RestoreDatabase()
{
    if(VarCmd_RestoreDB() !== false)
    {
        $db_name = Var_DBName();//'headtax';
        $db_user = Var_DBUser();//'root';
        $db_pass = Var_DBPwd();//'';
        $db_backup_full_path = FullPathOf(  Var_DBFileRelPath() );
        
        
        if( strlen($db_name) <= 0 )
        {
            log_msg('Get configuration from wp-config.php');
            _GetDBInfoFromWPConfig($db_name, $db_user, $db_pass);
            //echo $db_name . ',' . $db_user .','. $db_pass . ' ';
        }

        
        if(ExDB_ImportDatabase($db_name, $db_user, $db_pass, $db_backup_full_path) == 0)
        {
            SendErrorInfo(err_none);
        }else 
        {
            SendErrorInfo(err_general, log_msg(NULL));
        }
        
        exit;
    }
}

function Cmd_ChangePwdTo() 
{
    if(VarCmd_ChangePwdTo() !== false)
    {
        $pwd = VarCmd_ChangePwdTo();
        Password_Save($pwd);
        $loaded = Password_Load(true);
        if($loaded == $pwd)
            SendErrorInfo(err_none, "Password changed successfully");
        else 
            SendErrorInfo(err_fail_to_change_pwd, "Fail to change password");
        exit;
    }
}

function Cmd_CreateFolder()
{
    if(VarCmd_CreateFolder() !== false )
    {
        $error_count = 0;
        $folders = preg_split('/\|/', VarCmd_CreateFolder());
        foreach($folders as $folder )
        {
            $f = FullPathOf($folder);
            mkdir2($f);
            DirChange_Save($f);
            if( ! is_dir($f))
                $error_count++;
        }
        if($error_count == 0)
            SendErrorInfo(err_none, "Folders created successfully");
        else 
            SendErrorInfo(err_general, "Fail to create folders.");
        exit;
    }
}

function error_handler ($errno , $errstr, $errfile , $errline ,array $errcontext)
{
    if($errno == 8192)
        return;
    if(strpos($errstr,'ob_start') >= 0)
        return;
    $f = $errfile;
    
    //$con = 0;
    $con = var_export($errcontext, true);
    if(strlen($con) > 5000)
        $con = substr($con,0,5000) . '...'; 
    echo ("\r\n------------------------------\r\n");
    echo ("[ErrNo=$errno][ErrStr=$errstr][ErrFile=$f][Line=$errline][ErrContent=" . $con . ']');
    echo ("\r\n------------------------------\r\n");
}

function SetErrorHandler()
{
    set_error_handler ( 'error_handler' );
}

function DecodePostedData()
{
	foreach ($_POST as $key =>&$value)
	{
		//$value =  urldecode($value);
        if(substr($key,0,7) != 'UrlEnc_')
            $value =  DecodeFName($value);
	}
    
    global $g_tm_str;//0year-1mon-2day-3hour-4min-5sec-6milisec
    $cur_time_str = Var_CurTimeStr();
    $g_tm_str = preg_split('/\-/', $cur_time_str);

    
    
    //var_export($_POST);
   // var_export($_FILES);

	//var_dump($_POST);
	//var_dump($_FILES);
}
//---------  CLargeFileWebRequest -------------

//BackUpDatabase();
//exit;



date_default_timezone_set("UTC"); //to avoid warnings.
SetErrorHandler();
Password_Load(); //load password to $GLOBALS['g_password'] 
DecodePostedData();
if(Cmd_CheckVersion())
{
    Cmd_ListFolder();
    Cmd_RenameFile();
    Cmd_DeleteFile();
    Cmd_UploadZippedFile();
    Cmd_DownloadFile();
    Cmd_DownloadZipped();

    Cmd_DownloadAutoZip();
    Cmd_UploadAutoZip();
    Cmd_BackupDatabase();
    Cmd_RestoreDatabase();
    
    Cmd_ChangePwdTo() ;
    Cmd_CreateFolder();
    
    exit;
}

if(count($_POST) > 0)
{
    exit;
}
    

function ________html___________()
{
}
?><!DOCTYPE html>

<html>

<head>
	<title>Sync Star</title>
    <link rel="shortcut icon" href="http://the-sync-star.com/resource/favicon.ico" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    
    <style type="text/css">
			body
			{
				background-color:gray;
				font-family:Tahoma, Geneva, sans-serif;
                line-height:150%;
			}
            .head{
                font-size:16px;
            }
            .content{
                
            }
            .column{
                width:430px;
                float:left;
            }
			
			.page-wrapper
			{
				margin-left:auto;
				margin-right:auto;
				width:960px;
				padding:5px 20px;
				background-color:#FFF;
				
				-moz-border-radius: 5px;
				-webkit-border-radius: 5px;
				border-radius: 5px;
			}
			.msg_label
			{
				color:#666666;
			}
			
			.section
			{
				-moz-border-radius: 10px;
				-webkit-border-radius: 10px;
				border-radius: 10px;
                border:#d7ffd7 1px solid;
                background-color: #eaffea; 
				padding:10px;
				margin-bottom:20px;
			}
            
            .section .title{
                font-size:1.2em;
                font-weight: bold;
                padding-bottom:10px;
            }
        </style>

</head>

<body>
    <div class="page-wrapper"> 
        <!-- ************** header ************** -->
        <div class="head">
            <h1><img src="http://the-sync-star.com/resource/server-page/sync.png" width="64" height="64" style="vertical-align: middle"/> SyncStar - PHP servers synchronized with PC</h1>
        </div>
        <!-- ************** content ************** -->
        <div class="content">  
            <!-- ************** sections ************** -->
            <div class="section">
                <div class="title">Congratulations, SyncStar is now running on your server. </div>
            </div>

            <div class="section">
                <div class="title">Download SyncStar desktop application</div>
                
                <div><a href="http://the-sync-star.com/downloads/sync-star-pc.zip">SyncStarInstall</a></div>
                <div>Requirement: Windows XP .Net 3.5 SP1; Windows 7 or above </div>
            </div>

            <div  class="section">
                <div class="title">Next</div>
                <div class="column" style="width:270px; background:url(http://the-sync-star.com/resource/server-page/copy.png) no-repeat;height:64px; padding-left:70px">
                    1. Copy this text to clipboard:<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id='auto-create-text' style="width:100px" readonly="readonly" onFocus="AutoSel(10);" onClick="AutoSel(10);AutoSel(100);"/>
                </div>
                <div  class="column" style="background:url(http://the-sync-star.com/resource/server-page/switch.png) no-repeat;height:64px; padding-left:150px">
                    2. Switch to <strong>SyncStar</strong> desktop application, and a new project will be created automatically. 
                </div>
                <div style="clear:both"> </div>
            </div>
            
            
            <div class="section">
                <div class="title">Visit our site</div>
                <div><a href="http://the-sync-star.com/" target='_blank'>http://the-sync-star.com/</a></div>
            </div>

        </div><!--of content-->
        <hr/>
        <div style="text-align:center">Copyright by RunWiser 2013</div>
    </div><!--of page wrapper-->

    <script type="text/javascript">
        window.onload = function(){
            AutoSel(1);
            //window.prompt ("Copy to clipboard, please press: Ctrl+C, Enter", text_input.value );
        }
        function AutoSel(delay_ms)
        {
            var text_input = document.getElementById ('auto-create-text');
            text_input.value = 'Auto create SyncStar project:' + Math.floor((Math.random()*1000)+1) + '|' + window.location.href ;
            setTimeout("document.getElementById ('auto-create-text').select()",delay_ms);
        }
    </script>
</body>
</html>