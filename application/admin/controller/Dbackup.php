<?php
namespace app\admin\controller;
//引入公共类
use app\admin\controller\Base;
use \tp5er\Backup;


//Index继承Base公共类。 注：类开头必须是大写字母
class Dbackup extends Base
{


    //数据库备份界面
    public function index()
    {
        return $this->fetch('list'); 
    }

    //数据库初始化设置
    public function dconfig()
    {
        $config=array(
            'path'     => './Data/',//数据库备份路径
            'part'     => 20971520,//数据库备份卷大小
            'compress' => 0,//数据库备份文件是否启用压缩 0不压缩 1 压缩
            'level'    => 9 //数据库备份文件压缩级别 1普通 4 一般  9最高
        );
        $db=new Backup($config);
        return $db;
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
        $dlist=$this->dconfig()->fileList();
        $count=count($dlist);
        $list=JSON(['code'=>0,'msg'=>'','count'=>$count,'data'=>$dlist]);
        return $list;
    }

    //备份所有表
    public function export()
    {
        foreach ($this->dconfig()->dataList() as $k => $v) {
            $this->dconfig()->backup($v['name'],0);
        }
        return success('index','备份成功');
    }

    //还原所有表
    public function import()
    {
        $this->dconfig()->import(0);
    }


}
