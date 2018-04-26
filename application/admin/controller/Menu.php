<?php

namespace app\admin\controller;


use app\admin\controller\Base;
use think\Request;

//引入数据库
use app\admin\model\Menu as Data;

class Menu extends Base
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
        // $data=Data::where('id','>',1) -> field('id,username,email,mobile') -> select();
        // $data=Data::all();
        // key是查询的变量，设默认值为0
        $count=Data::count();
        if ($key==NULL){
          $data=Data::where('id','>',$key) -> order('id desc') -> paginate($limit);
        }else
        {
          $data=Data::where('name','like',$key.'%') -> order('id desc') -> paginate($limit); 
          $count=count($data);  
        }

        $page=$data->render();

        
        //把多维数组分离出来，提取用 ->toArray()['data']数组
        $list=JSON(['code'=>0,'msg'=>'','count'=>$count,'data'=>$data->toarray()['data']]);
        return $list;
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
            Data::update(['status'=>0],['id'=>$id]);
        } else {
            Data::update(['status'=>1],['id'=>$id]);
        }
    }

    //渲染编辑界面
    public function edit(Request $request,$id)
    {
        $result = Data::get($id);
        $this -> view -> assign('info',$result);
        //获取所有分类的列表
        $data = Data::getCateData($id);
        $cate= Data::tree($data);
        // halt($cate1);
        $this -> view -> assign('cate',$cate);
        return $this -> view -> fetch('add');

      return $this -> view -> fetch('add');
    }

    //渲染添加界面
    public function add()
    {
      $cate = Data::tree(Data::all());
      $this -> view -> assign('cate',$cate);
      return $this -> view -> fetch('add');      
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

    //恢复所有操作
    // public function undel()
    // {   
    //     $res = Data::onlyTrashed()->field('id')->select();
    //     foreach ($res as $key => $value) {
    //       Data::update(['delete_time'=>NULL],['id'=>$value['id']]);
    //     }
        
    // }

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

    //左侧菜单数据
    // public function nav()
    // {
    //     $data=\app\admin\model\Menu::where('id','>',0)->field('id,pid,name') ->select();
    //     return JSON($data);
    // }


    public function tree($data,$id)
    {   
        // //无限级菜单的记录集就要用static来记忆每一个数据
        // static $res=[];
        
        // 查找子栏的下级不用记录每一个数据
        $res=[];
        foreach ($data as $key => $vo) {
            if($vo['pid']==$id){
                $res[] = ['id'=>$vo['id'],'title'=>$vo['name'],'icon'=>$vo['icon'],'url'=>$vo['a']];
                self::tree($data,$vo['id']);              
            } 
        }
        return $res;
    }




    public function showmenu()
    {
        //设定子菜单项
        static $child=[];

        //获取user_id 的权限值
        $a=\app\admin\model\Admin::with('group')->where('id',session('user_id')) ->select();
        $menu=$a[0]->toArray()['rules'];

        //如果是admin就显示所以菜单
        if(session('user_id')==1){
            $data=Data::where('status',1)->field('id,name,pid,icon,c,a')->select(); 
        }else
        {
            $data=Data::where('status',1)->where('id','in',$menu)->field('id,name,pid,icon,c,a')->select();  
        }
        
        foreach ($data as $key => $v) {
            if($v['pid']==0){
                $child[]= ['id'=>$v['id'],'title'=>$v['name'],'icon'=>$v['icon'],'url'=>$v['a'],'children'=>self::tree($data,$v['id'])];
            }
        }
        return JSON($child);
    }

    

}
