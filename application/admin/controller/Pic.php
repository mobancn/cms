<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Request;
//引入admin数据库
use app\admin\model\Pic as Data;

class Pic extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
       return $this -> view -> fetch('list');
    }


    //用户数据返回json格式列表
    public function datalist($page=1,$limit=10,$key=0)
    {   
        //所有数据
        // $data=Data::all();
        //查询 $limit条数据 并 分页$page  $key 是查询键值
        $res=[];
        if ($key==NULL){
          $data=Data::where('id','>',$key) -> order('id desc')-> paginate($limit);
        }else
        {
          $data=Data::where('name','=',$key) -> order('id desc')-> paginate($limit);   
        }

        $page=$data->render();
        $count=Data::count();
        foreach ($data as $key => $v) {
          $res[]=['src'=>$v['link'],'thumb'=>$v['thumb'],'alt'=>$v['name'],'pid'=>$v['id']];  
        }
        //转换为json数据输出
        $list=JSON(['title'=>0,'id'=>'Images','start'=>0,'data'=>$res]);
        return $list;
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

    //批量删除
    public function alldel(Request $request)
    {   
        $del_id=$request -> param('id');
        //接收字符串，分为数组
        $del_arr=explode(',', $del_id);
        //直接软删除操作
        Data::destroy($del_id,true);      
    }



}
