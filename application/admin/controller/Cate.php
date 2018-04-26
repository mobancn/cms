<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Request;
//引入admin数据库
use app\admin\model\Cate as Data;

class Cate extends Base
{
    //渲染主界面
    public function index()
    {
    	return $this -> view -> fetch('list');
    }


    //渲染添加界面
    public function add()
    {
      //添加角色
      $cate = Data::getCate();
      $this -> view -> assign('cate',$cate);
      return $this -> view -> fetch('add');      
    }


     /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $result = Data::get($id);
        $this -> view -> assign('info',$result);
        //获取所有分类的列表
        $data = Data::getCateData($id);
        $cate= Data::tree($data);
        // halt($cate1);
        $this -> view -> assign('cate',$cate);
        return $this -> view -> fetch('add');
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
        Data::destroy($del_id,true);      
    }

    //单个软删除
    public function del(Request $request)
    {   
        $del_id=$request -> param('id');
        //直接软删除操作
        Data::destroy($del_id,true);      
    }


    //用户数据返回json格式列表
    public function datalist()
    {   
       
        // $data=Data::where('id','>',1) -> field('id,username,email,mobile') -> select();
        // $data=Data::all();
        // key是查询的变量，设默认值为0
        $count=Data::count();

        $tree=Data::getCate();
        // $data=Data::with('group')->select();
        //不用关联表，就可以任何表的数据
        // foreach ($data as $key => $value) {
        //   $value -> groupname =model('Group')->where('id',$value['group'])->field('name')->find()['name'];
        // }
        
        //把多维数组分离出来，提取用 ->toArray()['data']数组
        
        $list=JSON(['code'=>0,'msg'=>'','count'=>$count,'data'=>$tree]);
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
