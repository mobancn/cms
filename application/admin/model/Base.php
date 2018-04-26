<?php

namespace app\admin\model;

use think\Model;
use traits\model\SoftDelete;


class Base extends Model
{
	// 软删除
	use SoftDelete;

	//自动时间
	protected $autoWriteTimestamp=true;

	protected $hidden=['delete_time','password'];

	//格式化日期
	protected $dateFormat = "Y/m/d";

	
}
