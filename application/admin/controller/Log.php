<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Request;
//引入admin数据库
use app\admin\model\Log as Data;

class Log extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
       return $this -> view -> fetch('log');
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
          $data=Data::where('m','=',$key) -> order('id desc')-> paginate($limit);   
        }

        $page=$data->render();
        $count=$data->toArray()['total']; 
        //转换为json数据输出
        $list=JSON(['code'=>0,'msg'=>'','count'=>$count,'data'=>$data->toarray()['data']]);
        return $list;
    }

    //清空日志
    public function alldel()
    {   
      Data::where('id','>',0)->delete();
    }

}
