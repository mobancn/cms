<?php
namespace app\admin\controller;
//引入公共类
use app\admin\controller\Base;
use app\admin\model\Config as Data;


//Index继承Base公共类。 注：类开头必须是大写字母
class Config extends Base
{

    //系统设置界面
    public function index()
    {
        return $this -> view -> fetch('list');
    }

    //所有数据
    public function datalist($page=1,$limit=10,$key=0)
    {	
    	//key 是搜索关键字
        if ($key==NULL){
          $data=Data::where('id','>',$key) -> order('id desc')-> paginate($limit);
        }else
        {
          $data=Data::where('name','=',$key) -> order('id desc')-> paginate($limit);   
        }
        //分页
        $page=$data->render();
        //数据库的总记录数
        $count=Data::count();
        //转换为json数据输出
        $list=JSON(['code'=>0,'msg'=>'','count'=>$count,'data'=>$data->toarray()['data']]);
        return $list;
    	
    }

}
