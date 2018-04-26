<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Request;
//引入admin数据库
use app\admin\model\Admin as Data;

class User extends Base
{
    //渲染主界面
    public function index()
    {
    	return $this -> view -> fetch('userList');
    }

    //渲染编辑界面
    public function edit(Request $request)
    {
      $userid=$request -> param();
      $user=Data::get($userid);
      $this -> view -> assign('info',$user);
      //只要某些字段的值 用 field('id,name')的方式，切记必须在''里面，不用分开
      //添加角色
      $group=\app\admin\model\Group::where('status',1) -> select();
      $this-> view ->assign('group',$group);

      return $this -> view -> fetch('userEdit');
    }

    //渲染添加界面
    public function add()
    {
      //添加角色
      $group=\app\admin\model\Group::all();
      $this-> view ->assign('group',$group);
      return $this -> view -> fetch('userAdd');      
    }

    //检测用户名是否可用
    public function checkUserName(Request $request)
    {
        $userName = trim($request -> param('username'));
        if (Data::get(['username'=> $userName])) {
            //如果在表中查询到该用户名
            $msg = '用户名已存在,请重新录入';
        }
        return $msg;
    }

    //渲染修改密码界面
    public function change()
    {
      return $this -> view -> fetch('changePwd');      
    }


    //状态变更
    public function setStatus(Request $request)
    {
        //获取当前的班级ID
        $id = $request -> param('id');

        //查询
        $res = Data::get($id);

        //启用和禁用处理
        if($res['status'] == 1) {
            Data::update(['status'=>2],['id'=>$id]);
        } else {
            Data::update(['status'=>1],['id'=>$id]);
        }
    }

    //批量软删除
    public function alldel(Request $request)
    {   
        $del_id=$request -> param('id');
        //接收字符串，分为数组
        $del_arr=explode(',', $del_id);
        //直接软删除操作
        Data::destroy($del_id);      
    }

    //单个软删除
    public function del(Request $request)
    {   
        $del_id=$request -> param('id');
        //直接软删除操作
        Data::destroy($del_id);      
    }


    //用户数据返回json格式列表
    public function userlist($page=1,$limit=10,$key=0)
    {   
       
        // $data=Data::where('id','>',1) -> field('id,username,email,mobile') -> select();
        // $data=Data::all();
        // key是查询的变量，设默认值为0
        $count=Data::count();
        if ($key==NULL){
          $data=Data::where('id','>',$key) -> order('id desc') -> paginate($limit);
        }else
        {
          $data=Data::where('username','like',$key.'%') -> order('id desc') ->  paginate($limit); 
          $count=count($data);  
        }

        $page=$data->render();
        
        // //不用关联表，就可以任何表的数据
        // foreach ($data as $key => $value) {
        //   $value -> groupname =model('Group')->where('id',$value['group_id'])->field('name')->find()['name'];
        // }

        //关联表数据,用 with 预载入数据
        $data=Data::with('group')->select();
        
        //把多维数组分离出来，提取用 ->toArray()['data']数组
        $list=JSON(['code'=>0,'msg'=>'','count'=>$count,'data'=>$data]);
        return $list;
    }

    //恢复所有操作
    public function undel()
    {   
        $res = Data::onlyTrashed()->field('id')->select();
        foreach ($res as $key => $value) {
          Data::update(['delete_time'=>NULL],['id'=>$value['id']]);
        }
        
    }

    //保存数据
    public function save(Request $request,$id=0)
    {
        $data=$request ->param(); 
        //未初始化的空值 用empty()函数,未初始化的数据集，用isempty()函数
        if($id==0)
        {
         Data::create($data); 
        }
        else
        {
         Data::update($data,['id'=>$id]);
        }
    }




}
