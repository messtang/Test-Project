<?php
/**
 * Project: 剑鱼论坛 - Forum system developed by catfish cms.
 * Producer: catfish(鲶鱼) cms [ http://www.catfish-cms.com ]
 * Author: A.J <804644245@qq.com>
 * License: Catfish CMS License ( http://www.catfish-cms.com/licenses/ccl )
 * Copyright: http://jianyuluntan.com All rights reserved.
 */
namespace app\install\controller;
use catfishcms\Catfish;
use think\Controller;
use think\Validate;
use think\Request;
use think\Db;
class Index extends Controller
{
    private $lang;
    public function _initialize()
    {
        $this->lang = Catfish::detectLang();
        Catfish::loadLang(APP_PATH . 'install/lang/'.$this->lang.'.php');
    }
    public function index()
    {
        $this->check();
        $this->assign('CatfishCMS',Catfish::getConfig('jianyu'));
        $license = Catfish::fgc(APP_PATH . 'LICENSE.txt');
        $this->assign('license',$license);
        $this->domain();
        $view = $this->fetch();
        return $view;
    }
    public function step1()
    {
        $this->check();
        $right = '<i class="fa fa-check text-success"></i> ';
        $wrong = '<i class="fa fa-times text-danger"></i> ';
        $data=array();
        $data['phpversion'] = @ phpversion();
        $data['os']=PHP_OS;
        $err = 0;
        if (version_compare($data['phpversion'], '5.4.0', '>=')) {
            $data['phpversion'] = $right . $data['phpversion'];
        }
        else {
            $data['phpversion'] = $wrong . $data['phpversion'];
            $err++;
        }
        if (class_exists('pdo')) {
            $data['pdo'] = $right . Catfish::lang('Turned on');
        } else {
            $data['pdo'] = $wrong . Catfish::lang('Unopened');
            $err++;
        }
        if (extension_loaded('pdo_mysql')) {
            $data['pdo_mysql'] = $right . Catfish::lang('Turned on');
        } else {
            $data['pdo_mysql'] = $wrong . Catfish::lang('Unopened');
            $err++;
        }
        if (ini_get('file_uploads')) {
            $data['upload_size'] = $right . ini_get('upload_max_filesize');
        } else {
            $data['upload_size'] = $wrong . Catfish::lang('Upload is prohibited');
        }
        if (function_exists('curl_init')) {
            $data['curl'] = $right . Catfish::lang('Turned on');
        } else {
            $data['curl'] = $wrong . Catfish::lang('Unopened');
            $err++;
        }
        if (function_exists('gd_info')) {
            $data['gd'] = $right . Catfish::lang('Turned on');
        } else {
            $data['gd'] = $wrong . Catfish::lang('Unopened');
            $err++;
        }
        if (class_exists('ZipArchive')) {
            $data['ZipArchive'] = $right . Catfish::lang('Turned on');
        } else {
            $data['ZipArchive'] = $wrong . Catfish::lang('Unopened');
            $err++;
        }
        if (function_exists('session_start')) {
            $data['session'] = $right . Catfish::lang('Turned on');
        } else {
            $data['session'] = $wrong . Catfish::lang('Unopened');
            $err++;
        }
        $lujing = ltrim(str_replace('/index.php','',Catfish::oUrl('/')),'/');
        $folders = array(
            'data',
            'data/uploads',
            'jianyu',
            'runtime',
            'runtime/cache',
            'runtime/log',
            'runtime/temp'
        );
        $new_folders=array();
        foreach($folders as $dir){
            $Testdir = "./".$dir;
            $this->createDir($Testdir);
            if($this->testWrite($Testdir)){
                $new_folders[$lujing.$dir]['w']=true;
            }else{
                $new_folders[$lujing.$dir]['w']=false;
                $err++;
            }
            if(is_readable($Testdir)){
                $new_folders[$lujing.$dir]['r']=true;
            }else{
                $new_folders[$lujing.$dir]['r']=false;
                $err++;
            }
        }
        $data['folders']=$new_folders;
        $this->assign('CatfishCMS',Catfish::getConfig('jianyu'));
        $this->assign('data',$data);
        $this->assign('error',$err);
        $this->domain();
        $view = $this->fetch();
        return $view;
    }
    private function createDir($path, $mode = 0777)
    {
        if(is_dir($path))
            return true;
        $path = str_replace('\\', '/', $path);
        if(substr($path, -1) != '/')
            $path = $path . '/';
        $temp = explode('/', $path);
        $cur_dir = '';
        $max = count($temp) - 1;
        for($i = 0; $i < $max; $i++)
        {
            $cur_dir .= $temp[$i] . '/';
            if (@is_dir($cur_dir))
                continue;
            @mkdir($cur_dir, 0777, true);
            @chmod($cur_dir, 0777);
        }
        return is_dir($path);
    }
    private function testWrite($d)
    {
        $tfile = "_test.txt";
        $fp = @fopen($d . "/" . $tfile, "w");
        if (!$fp) {
            return false;
        }
        fclose($fp);
        $rs = @unlink($d . "/" . $tfile);
        if ($rs) {
            return true;
        }
        return false;
    }
    public function step2()
    {
        $this->check();
        $this->assign('CatfishCMS',Catfish::getConfig('jianyu'));
        $this->domain();
        $view = $this->fetch();
        return $view;
    }
    public function step3()
    {
        $this->check();
        $rule = [
            'host' => 'require',
            'port' => 'require|number',
            'user' => 'require',
            'name' => 'require',
            'admin' => 'require',
            'pwd' => 'require|min:8',
            'repwd' => 'require',
            'email' => 'require|email'
        ];
        $msg = [
            'host.require' => Catfish::lang('The database server must be filled out'),
            'port.require' => Catfish::lang('The database port must be filled in'),
            'port.number' => Catfish::lang('The database port must be a number'),
            'user.require' => Catfish::lang('The database user name must be filled in'),
            'name.require' => Catfish::lang('The database name must be filled in'),
            'admin.require' => Catfish::lang('The administrator account must be filled in'),
            'pwd.require' => Catfish::lang('The administrator password is required'),
            'pwd.min' => Catfish::lang('The administrator password can not be less than 8 characters'),
            'repwd.require' => Catfish::lang('Confirm password is required'),
            'email.require' => Catfish::lang('Email is required'),
            'email.email' => Catfish::lang('Email format is incorrect')
        ];
        $data = [
            'host' => Catfish::getPost('host'),
            'port' => Catfish::getPost('port'),
            'user' => Catfish::getPost('user'),
            'name' => Catfish::getPost('name'),
            'admin' => Catfish::getPost('admin'),
            'pwd' => Catfish::getPost('pwd'),
            'repwd' => Catfish::getPost('repwd'),
            'email' => Catfish::getPost('email')
        ];
        $validate = new Validate($rule, $msg);
        if(!$validate->check($data))
        {
            $this->error($validate->getError());
        }
        elseif($data['pwd'] !== $data['repwd'])
        {
            $this->error(Catfish::lang('The "Administrator Password" and "Confirm Password" must be the same'));
        }
        else
        {
            ini_set('max_execution_time','0');
            try{
                $dbh=new \PDO('mysql:host='.$data['host'].';port='.$data['port'],$data['user'],Catfish::getPost('password'));
                $dbh->exec('CREATE DATABASE IF NOT EXISTS `' . $data['name'] . '` DEFAULT CHARACTER SET utf8');
            }catch(\Exception $e){
                $this->error(Catfish::lang('Database information error'));
                return false;
            }
            $this->assign('CatfishCMS',Catfish::getConfig('jianyu'));
            $domain = $this->domain();
            $sql = Catfish::fgc([APP_PATH . 'install/data/catfish.sql', APP_PATH . 'install/data/jianyu.sql']);
            $default_tablepre = "catfish_";
            $sql = str_replace([" `{$default_tablepre}", '#yue#'], [" `" . Catfish::getPost('prefix'), date('Ym')], $sql);
            $sql = str_replace("\r", "\n", $sql);
            $sql = explode(";\n", $sql);
            foreach ($sql as $item) {
                $item = trim($item);
                if(empty($item)) continue;
                $this->dbExec($item);
            }
            $create_date=date("Y-m-d H:i:s");
            $cstr = 'a:5:{i:0;s:7:"UG93ZXJ";i:1;s:7:"lZCBieS";i:2;s:7:"BKaWFuW";i:3;s:7:"XVMdW5U";i:4;s:4:"YW4=";}';
            $rmd = md5($create_date . ' ' . rand());
            $this->dbExec("INSERT INTO `" . Catfish::getPost('prefix') . "users`
    (id,yonghu,password,nicheng,email,createtime,randomcode,status,utype) VALUES
    (1, '" . Catfish::getPost('admin') . "', '" . md5(Catfish::getPost('pwd').$rmd) . "', '" . substr(md5($rmd),0,6) . "', '" . Catfish::getPost('email') . "', '{$create_date}', '{$rmd}', 1, 1)");
            $this->dbExec("INSERT INTO `" . Catfish::getPost('prefix') . "users_tongji` (id,uid) VALUES (1, 1)");
            $this->dbExec("INSERT INTO `" . Catfish::getPost('prefix') . "users_info` (id,uid) VALUES (1, 1)");
            $qu = $this->dbExec('select * from '.Catfish::getPost('prefix').'users_info where id=1',true);
            if(empty($qu))
            {
                $this->error(Catfish::lang('Bad database name'));
            }
            $view = $this->fetch();
            echo $view;
            $biaoti = Catfish::getPost('biaoti');
            $biaoti = str_replace('\'','\\\'',$biaoti);
            $rewrite = 0;
            if(Catfish::isRewrite()){
                $rewrite = 1;
            }
            $this->dbExec("INSERT INTO `" . Catfish::getPost('prefix') . "options` (id,option_name,option_value,autoload) VALUES (1, 'title', '" . $biaoti . "', 1),(2, 'subtitle', '又一个剑鱼论坛', 1),(3, 'keyword', '', 1),(4, 'description', '', 1),(5, 'template', 'default', 1),(6, 'record', '', 1),(7, 'serial', '', 1),(8, 'statistics', '".serialize('')."', 1),(9, 'domain', '".$domain."', 1),(10, 'logo', '', 1),(11, 'captcha', '1', 1),(12, 'rewrite', ".$rewrite.", 1),(13, 'closeSlide', 1, 1),(14, 'icon', '', 1),(15, 'openMessage', 0, 1),(16, 'closeSitemap', 0, 0),(17, 'closeRSS', 0, 0),(18, 'closeSite', 0, 1),(19, 'creationtime', '{$create_date}', 1),(20, 'random', '{$rmd}', 0),(21, 'filtername', '', 0),(22, 'regvery', 0, 0),(23, 'spare', '', 0),(24, 'crt', '".$cstr."', 1),(25, 'cyrt', '".serialize('©&nbsp;date&nbsp;5YmR6bG86K665Z2b&nbsp;54mI5p2D5omA5pyJ')."', 1),(26, 'users', 1, 0)");
            $this->dbExec("INSERT INTO `" . Catfish::getPost('prefix') . "tietype` (id,tpname,bieming) VALUES (1, 'original', 'original'),(2, 'reprint', 'reprint')");
            $this->dbExec("INSERT INTO `" . Catfish::getPost('prefix') . "dengji` (id,jibie,djname,chengzhang) VALUES (1, 1, 'born', 0),(2, 2, 'young child', 50),(3, 3, 'kindergarten', 150),(4, 4, 'primary school student', 300),(5, 5, 'junior high school student', 500),(6, 6, 'high school student', 750),(7, 7, 'college students', 1050),(8, 8, 'postgraduate', 1400),(9, 9, 'doctoral student', 1800),(10, 10, 'postdoctoral', 2300)");
            $this->dbExec("INSERT INTO `" . Catfish::getPost('prefix') . "chengzhang` (id,czname,chengzhang) VALUES (1, 'login', 1),(2, 'post', 5),(3, 'followup', 2),(4, 'reply', 2),(5, 'access', 1),(6, 'like', 1),(7, 'stepon', 1),(8, 'flike', 1),(9, 'fstepon', 1),(10, 'collection', 1)");
            $this->dbExec("INSERT INTO `" . Catfish::getPost('prefix') . "forum` (id,geshi) VALUES (1,'doc,docx,xls,xlsx,ppt,txt,zip,rar,gz,bz2,7z,jpg,png,gif,jpeg,bmp,swf,flv,mp3,mp4,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb,webm,ogg,svg,psd,tif,pcx,tga,exif,fpx,cdr,pcd,dxf,ufo,eps,ai,raw,wmf,webp,apk,pdf')");
            $this->dbExec("INSERT INTO `" . Catfish::getPost('prefix') . "tongji` (id,riqi) VALUES (1,'".date("Y-m-d")."')");
            $conf = Catfish::fgc(APP_PATH . 'install/data/database.php');
            $data['password'] = Catfish::getPost('password');
            $data['prefix'] = Catfish::getPost('prefix');
            foreach ($data as $key => $value) {
                $conf = str_replace("#{$key}#", $value, $conf);
            }
            file_put_contents(APP_PATH . 'database.php', $conf);
            echo '<div class="d-none">';
            $this->success(Catfish::lang('Installation completed'), 'step4');
            echo '</div>';
        }
        return '';
    }
    public function step4()
    {
        $this->assign('CatfishCMS',Catfish::getConfig('jianyu'));
        $this->domain();
        $view = $this->fetch();
        return $view;
    }
    private function check()
    {
        if(is_file(APP_PATH . 'database.php')){
            $this->redirect('index/Index/index');
            exit;
        }
    }
    private function domain()
    {
        $http = Request::instance()->isSsl() ? 'https://' : 'http://';
        $domain = $http . str_replace("\\",'/',$_SERVER['HTTP_HOST'].str_replace('/index.php','', Catfish::oUrl('/')));
        $domain = substr($domain, -1, 1) == '/' ? $domain : $domain . '/';
        $this->assign('domain',$domain);
        return $domain;
    }
    private function dbExec($exStr,$query = false)
    {
        try{
            $cnn = Db::connect([
                'type' => 'mysql',
                'dsn' => '',
                'hostname' => Catfish::getPost('host'),
                'database' => Catfish::getPost('name'),
                'username' => Catfish::getPost('user'),
                'password' => Catfish::getPost('password'),
                'hostport' => Catfish::getPost('port'),
                'params' => [],
                'charset' => 'utf8',
                'prefix' => Catfish::getPost('prefix')
            ]);
            if($query == false)
            {
                $cnn->execute($exStr);
            }
            else
            {
                return $cnn->query($exStr);
            }
        }catch(\Exception $e){
            return false;
        }
        return true;
    }
}