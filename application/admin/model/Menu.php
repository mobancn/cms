<?php

namespace app\admin\model;

use think\Model;
use think\Collection;
use app\admin\model\Base;

class Menu extends Base
{
    protected $table='cms_menu';

    //所有数据的树状结构的实现
    public static function getCate($pid=0, &$result=[], $blank=0)
    {
        //1.分类表查询:$pid
        $res = self::all(['pid'=>$pid]);

        //2.自定义分类名称前面的提示信息
        $blank += 3;

        //3.遍历分类表
        foreach ($res as $key => $value) {

            //3-1自定义分类名称的显示格式
            $value['treename'] = str_repeat('&nbsp;',$blank).'|--&nbsp;'.$value['name'];

            //3-2将查询到的当前记录保存到结果$result中
            $result[] = $value;

            //3-3关键:将当前记录的id，做为下一级分类的父id,$pid，继续递归调用本方法
            self::getCate($value->id, $result, $blank);
        }

        //4.返回查询结果,调用结果集类make方法打包当前结果,转为二维数组返回
        return Collection::make($result)->toArray();
    }

    //指定数据树状结构的实现
    public static function tree($res,$pid=0,$blank=0)
    {
        static $result=[];

        //2.自定义分类名称前面的提示信息
        $blank += 3;

        //3.遍历分类表
        foreach ($res as $key => $value) {

            //循环由0（即最顶层向下）开始查询
            if($value['pid']==$pid)
            {
                $value['treename']= str_repeat('&nbsp;',$blank).'|--&nbsp;'.$value['name'];

                //3-2将查询到的当前记录保存到结果$result中
                $result[] = $value;
                self::tree($res,$value['id'],$blank);
            }
 
        }

        //4.返回查询结果,调用结果集类make方法打包当前结果,转为二维数组返回
        return Collection::make($result)->toArray();
    }
    

        /**
     * 查找所属所有分类
     */
    public static function getCateData($id)
    {
        
        
        //查询所有子集的id
        $ids=self::getSon($id);
        //添加自己的id
        $ids[]=$id;
        //查询所有这些id的数据,
        // $res=self::all($ids);
        //查询上述id 以外的id数
        $res=self::where('id','not in',$ids)->select();
        

        return $res;

    }


    /**
     * 递归找子集
     **/
     
    public static  function getSon($id)
    {
        //初始化数组
        static $temp=[];
        $res=self::all();
        foreach ($res as  $v) {
            if($v['pid']==$id){
                $temp[]=$v['id'];
                self::getSon($v['id']);
            }
        }

        return $temp;

    }


    /**
     * 我的菜单
     * @param type $user_id
     * @param type $display 
     * @return array
     */
    public function getMyMenu($user_id, $display = null) {
        $where = array();
        if ($user_id != 1) {
            $res = db('cms_group')
                    ->alias('t1')
                    ->field('t2.rules')
                    ->join(config('database.prefix').'cms_group t2', 't1.group_id=t2.id', 'left')
                    ->where(['t1.uid' => $user_id])
                    ->select();
            if (!$res) {
                return false;
            }
            $tmp = '';
            foreach ($res as $k => $v) {
                $tmp .=$v['rules'] . ',';
            }

            $menu_ids = trim($tmp, ',');
            $where['id'] = ['in', $menu_ids];
        }


        if ($display) {
            $where['display'] = $display;
        }

        $res = db('menu')->where($where)->order('listorder asc')->select();

        return $res;
    }



}
