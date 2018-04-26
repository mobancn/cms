<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Base extends Controller
{
    //依赖注入 定议session('user_id')和session('user_name')
    protected $user_id;
    protected $user_name;

    public function __construct(Request $request=null)
    {
        parent::__construct($request);
        //执行登录验证
        //$_SESSION['admin']['admin_id'];
        if (!session('user_id'))
        {
            $this->redirect('./login');
        }

        $this -> user_id=session('user_id');
        $this -> user_name = session('user_name');
    }

    //  protected function _initialize()
    // {
    //     parent::_initialize();

    //     define('USER_ID', Session::has('user_id') ? Session::get('user_id'):null);
    // }

    // //判断用户是否登陆,放在系统后台入口前面: index/index
    // protected function isLogin()
    // {
    //     if (is_null(USER_ID)) {
    //         $this -> error('用户未登陆,无权访问',url('index'));
    //     }
    // }

    // //防止用户重复登陆,放在登陆操作前面:user/login
    // protected function alreadyLogin(){
    //     if (USER_ID) {
    //         $this -> error('用户已经登陆,请勿重复登陆',url('index/main'));
    //     }
    // }
    
}
