<?php
namespace app\admin\controller;
//引入公共类
use app\admin\controller\Base;
use fast\Dbmanage;


//Index继承Base公共类。 注：类开头必须是大写字母
class Dbackup extends Base
{


    //数据库备份界面
    public function index()
    {
        // return $this->fetch('list'); 
        $obj=new Dbmanage();
        halt($obj);
    }


        
    //数据库列表
    public function DataList()
    {    
        $dlist=$this->dconfig()->dataList();
        $count=count($dlist);
        $list=JSON(['code'=>0,'msg'=>'','count'=>$count,'data'=>$dlist]);
        return $list;
    }

    //数据库备份列表
    public function ImportList()
    {       

    }

    //备份所有表
    public function export()
    {
        
    }

    //还原所有表
    public function import()
    {
       
    }


}
