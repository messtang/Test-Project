<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:69:"D:\University\jianyuluntan_2.4.6/jianyu/install\view\index\index.html";i:1594107016;s:70:"D:\University\jianyuluntan_2.4.6\jianyu\install\view\index\header.html";i:1594107016;s:68:"D:\University\jianyuluntan_2.4.6\jianyu\install\view\index\head.html";i:1594107016;s:70:"D:\University\jianyuluntan_2.4.6\jianyu\install\view\index\footer.html";i:1594107016;}*/ ?>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><?php echo lang('Swordfish system installation'); ?></title>
    <link rel="icon" href="<?php echo $domain; ?>public/common/images/favicon.ico">
    <link rel="stylesheet" href="<?php echo $domain; ?>public/common/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo $domain; ?>public/common/font-awesome/css/font-awesome.min.css">
    <script src="<?php echo $domain; ?>public/common/js/jquery.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="card w-100 h-100 border-0 rounded-0">
            <div class="card-header bg-info text-white">
                <img src="<?php echo $domain; ?>public/common/images/jianyu_white.png" width="20" height="20">
<?php echo $CatfishCMS['name']; ?> - <?php echo $CatfishCMS['description']; ?> - <?php echo lang('Setup Wizard'); ?>
<span class="float-right"><?php echo $CatfishCMS['version']; ?></span>
            </div>
            <div class="card-body">
                <textarea class="form-control" rows="15"><?php echo $license; ?></textarea>
                <div class="text-center">
                    <a href="step1" class="btn btn-info mt-4"><?php echo lang('Accept'); ?></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>