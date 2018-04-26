<?php
namespace app\admin\controller;
//引入公共类
use app\admin\controller\Base;

//Index继承Base公共类。 注：类开头必须是大写字母
class Main extends Base
{

    //后台登录界面
    public function index()
    {
       return $this->view->fetch('/main');
    }

}
