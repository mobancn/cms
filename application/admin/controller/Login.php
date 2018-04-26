<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\admin\model\Admin;

class Login extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
      if (session('user_id'))
      {
        $this -> redirect('/admin/index');
      }else
      {
      return $this -> view -> fetch('/login');
      }
    }

    //验证登录数据
    public function checkLogin(Request $request)
    {
        $status=0;
        $data=$request -> param();
        $username=$data['username'];
        $password=$data['password'];

        // $user=Admin::get(['username'=>$username]); 
        // 查询删除和冻结以外的数据
        $user=Admin::withTrashed()->where('username',$username) ->where('status',1)->find(); 

        if($user==NULL){
            $msg='用户不存在';
        }
        else
        {
            if(md5($password) != $user['password']){
                $msg='密码错误';
            }
            else
            {   
                if(!captcha_check($data['code'])){
                    $msg='验证码错误';
                }
                else
                {
                        //创建2个session,用来检测用户登陆状态和防止重复登陆
                    session('user_id', $user -> id);
                    session('user_name', $user -> username);

                // cookie::set('user_name', encry_code($user->username));
                // cookie::set('user_id', encry_code($user->id));
                    $msg='登录成功';
                    $status=1;
                }  
            }
        }
                   
        return ['msg'=>$msg,'status'=>$status];

    }


    //退出登陆
    public function logout()
    {   
        session('user_id',null);
        session('user_name',null);

        $this->redirect('/admin/login');
    }
}
