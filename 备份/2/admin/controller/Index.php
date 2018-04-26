<?php
namespace app\admin\controller;
//引入公共类
use app\admin\controller\Base;

//Index继承Base公共类。 注：类开头必须是大写字母
class Index extends Base
{

    //后台登录界面
    public function index()
    {
        $this->view->engine->layout('/layout');
        return $this -> view -> fetch('main');
    }


}
