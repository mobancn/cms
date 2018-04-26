<?php

namespace app\admin\model;

use think\Model;
use app\admin\model\Base;

class Group extends Base
{
	//绑定数据表 cms_group
    protected $table='cms_group';

    //一对多关联数据
    public function admin()
    {
    	return $this -> hasMany('admin','id','group');
    }
   
}
