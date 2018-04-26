<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Base extends Controller
{
    //依赖注入 定议session('user_id')和session('user_name')
    protected $user_id;
    protected $user_name;

    //公共函数 防止未登录 login页不用继承 
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

        //权限检查,用日志查询控制器和方法，再进行权限筛选
        if (!$this->_checkAuthor($this->user_id)) {
            $this->error('你无权限操作','./login');
        }


        //记录日志
        $this->_addLog();
    }

    /**
     * 权限检查
     */
    private function _checkAuthor($user_id) {
        
        if (!$user_id) {
            return false;
        }
        if($user_id==1){
            return true;
        }

        $c = strtolower(request()->controller());
        $a = strtolower(request()->action());

        if (preg_match('/^public_/', $a)) {
            return true;
        }

        if ($c == 'index' && $a == 'index') {
            return true;
        }

        if ($c == 'main' && $a == 'index') {
            return true;
        }

        if ($c == 'menu' && $a == 'showmenu') {
            return true;
        }

        if ($a == 'datalist') {
            return true;
        }

        //查找user_id 的rules 的权限
        $list=\app\admin\model\Admin::with('group')->where('id',$user_id) ->select();
        $menu=$list[0]->toArray()['rules'];
        //查找对应的菜单项
        $show=\app\admin\model\Menu::all($menu);

        //遍历菜单项，返回可以使用的方法和控制器
        foreach ($show as $k => $v) {
            if (strtolower($v['a']) == $c) {
                return true;
            }
        }

        return false;
    }




    /**
     * 记录日志
     */
    private function _addLog() {

        $data = array();
        $data['querystring'] = request()->query()?'?'.request()->query():'';
        $data['c'] = strtolower(request()->controller());
        $data['a'] = strtolower(request()->action());
        $data['userid'] = $this->user_id;
        $data['m'] = $this->user_name;
        $data['ip'] = ip2long(request()->ip());
        
        // $arr = array('index','datalist','userlist','showmenu');
        // if(!in_array($data['a'], $arr)){
        //      model('Log')->create($data);
        // }            
        
        model('Log')->create($data);
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
