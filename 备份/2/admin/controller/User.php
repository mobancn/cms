<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Request;
//引入admin数据库
use app\admin\model\Admin;

class User extends Base
{
    //渲染主界面
    public function index()
    {
        $this->view->engine->layout('/layout');
    	return $this -> view -> fetch('user');
    }

    //渲染编辑界面
    public function edit(Request $request)
    {
      $userid=$request -> param();
      $user=Admin::get($userid);
      $this -> view -> assign('info',$user);
      //添加角色
      $group=\app\admin\model\Group::where('status',1) -> select();
      $this-> view ->assign('group',$group);

      return $this -> view -> fetch('info');
    }

    //渲染添加界面
    public function add()
    {
      //添加角色
      $group=\app\admin\model\Group::all();
      $this-> view ->assign('group',$group);
      return $this -> view -> fetch('info');      
    }


    //状态变更
    public function setStatus(Request $request)
    {
        //获取当前的班级ID
        $id = $request -> param('id');

        //查询
        $res = Admin::get($id);

        //启用和禁用处理
        if($res['status'] == 1) {
            Admin::update(['status'=>2],['id'=>$id]);
        } else {
            Admin::update(['status'=>1],['id'=>$id]);
        }
    }

    //批量软删除
    public function alldel(Request $request)
    {   
        $del_id=$request -> param('id');
        //接收字符串，分为数组
        $del_arr=explode(',', $del_id);
        //直接软删除操作
        Admin::destroy($del_id);      
    }

    //单个软删除
    public function del(Request $request)
    {   
        $del_id=$request -> param('id');
        //直接软删除操作
        Admin::destroy($del_id);      
    }


    //用户数据返回json格式列表
    public function userlist($page=1,$limit=10,$key=0)
    {   
       
        // $data=Admin::where('id','>',1) -> field('id,username,email,mobile') -> select();
        // $data=Admin::all();
        // key是查询的变量，设默认值为0
        $count=Admin::count();
        if ($key==NULL){
          $data=Admin::where('id','>',$key) -> order('id desc') -> paginate($limit);
        }else
        {
          $data=Admin::where('username','like',$key.'%') -> order('id desc') ->  paginate($limit); 
          $count=count($data);  
        }

        $page=$data->render();
        // $data=Admin::with('group')->select();
        //不用关联表，就可以任何表的数据
        foreach ($data as $key => $value) {
          $value -> group =model('Group')->where('id',$value['group'])->field('name')->find()['name'];
        }

        
        //把多维数组分离出来，提取用 ->toArray()['data']数组
        $list=JSON(['code'=>0,'msg'=>'','count'=>$count,'data'=>$data->toarray()['data']]);
        return $list;
    }

    //恢复所有操作
    public function undel()
    {   
        $res = Admin::onlyTrashed()->field('id')->select();
        foreach ($res as $key => $value) {
          Admin::update(['delete_time'=>NULL],['id'=>$value['id']]);
        }
        
    }

    //保存数据
    public function save(Request $request,$id)
    {
        $data=$request ->param(); 

        //未初始化的空值 用empty()函数
        if(empty($data['id']))
        {
         Admin::create($data); 
        }
        else
        {
         Admin::update($data,['id'=>$id]);
        }
    }

}
