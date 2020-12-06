package com.service;

import com.dao.wupinDao;
import com.model.wupin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class wupinService {
    @Autowired
    private wupinDao dao;

    /*
查所有
return List<wupin>
*/
    public List<Map> getAll(Map map){

        return dao.getAll(map);
    }

    /*
    根据ID查询
    {id} 要查询wupin的 id
     */
    public wupin getwupinByID(int id){


        return dao.getwupinByID(id);
    }

    /*
    删除
    {id} 要删除物品的 id
     */
    public void delete(int id){

        dao.delete(id);
    }

    /*
    更新
    {p} 要更新wupin实例
     */
    public  void update(wupin p){

       dao.update(p);
    }

    /*
    增加
    {p} 要新增的wupin实例
     */
    public void add(wupin p){

       dao.add(p);
    }


    public List<Map> noRepeat(String wp){

        return  dao.noRepeat(wp);
    }


}
