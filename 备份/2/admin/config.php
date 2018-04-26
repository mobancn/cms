<?php
//配置文件
return [
	// 入口自动绑定模块
    'auto_bind_module'       => true,

	
	//模板渲染CSS地址设置
	 'view_replace_str'       => ['__STATIC__' =>  '/public/static/admin',], 


	 'template'               => [
     'view_base'=>'./public/static/admin/', //入口文件在public/static/下,要与admin文件夹相对应
    ],
];