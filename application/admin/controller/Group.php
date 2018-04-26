<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Request;
//引入admin数据库
use app\admin\model\Group as Data;

class Group extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
       return $this -> view -> fetch('group');
    }


    //用户数据返回json格式列表
    public function datalist($page=1,$limit=10,$key=0)
    {   
        //所有数据
        // $data=Data::all();
        //查询 $limit条数据 并 分页$page  $key 是查询键值
        if ($key==NULL){
          $data=Data::where('id','>',$key) -> order('id desc')-> paginate($limit);
        }else
        {
          $data=Data::where('username','=',$key) -> order('id desc')-> paginate($limit);   
        }

        $page=$data->render();
        $count=Data::count();
        //转换为json数据输出
        $list=JSON(['code'=>0,'msg'=>'','count'=>$count,'data'=>$data->toarray()['data']]);
        return $list;
    }

    /**
     * 添加新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function add()
    {
        return $this -> view -> fetch('info');
    }

    public function edit($id)
    {
      $data=Data::get($id);
      $this -> view -> assign('info',$data);

      return $this -> view -> fetch('info');
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
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




    /**
     * 获取菜单的json数据
     * 数据传送 树式菜单 src/js/selecttree.js 的 setting 中设置链接
     * @param  int  $id
     * @return \think\Response
     */
    public function nav()
    {
        $data=\app\admin\model\Menu::where('id','>',0)->field('id,pid,name') ->select();
        return JSON($data);
    }





    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function del($id)
    {   
      Data::destroy($id,true);
    }



    /**
     * 状态变更
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function setStatus($id)
    {
        //查询
        $res = Data::get($id);
        //启用和禁用处理
        if($res['status'] == 1) {
            Data::update(['status'=>2],['id'=>$id]); 
            //设置关联用户的状态
            $status=2;
        } else {
            Data::update(['status'=>1],['id'=>$id]);
            //设置关联用户的状态
            $status=1;
        }
        //设置关联用户的状态
        \app\admin\model\Admin::where('group',$id)->setField('status',$status);
    }


}
