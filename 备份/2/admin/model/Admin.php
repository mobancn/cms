<?php

namespace app\admin\model;

use think\Model;
use app\admin\model\Base;
use think\Request;

class Admin extends Base
{
    protected $table='cms_admin';

    protected $update = ['lastloginip'];

    //密码修改器
    public function setPasswordAttr($value)
    {
        return md5($value);
    }

    protected function setlastloginipAttr()
    {
    	return ip2long(request()->ip());
    }

    //关联以id 为外键 角色数据表
    public function group(){
    	return $this -> belongsTo('Group','group');
    }



}
