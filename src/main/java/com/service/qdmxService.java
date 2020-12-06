package com.service;

import com.dao.qdmxDao;
import com.model.qdmx;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class qdmxService {
    @Autowired
    private qdmxDao dao;

    /*
查所有
return List<qdmx>
*/
    public List<Map> getAll(Map map){

        return dao.getAll(map);
    }

    /*
    根据ID查询
    {id} 要查询qdmx的 id
     */
    public qdmx getqdmxByID(int id){


        return dao.getqdmxByID(id);
    }

    /*
    删除
    {id} 要删除清单明细的 id
     */
    public void delete(int id){

        dao.delete(id);
    }

    /*
    更新
    {p} 要更新qdmx实例
     */
    public  void update(qdmx p){

        dao.update(p);
    }

    /*
    增加
    {p} 要新增的qdmx实例
     */
    public void add(qdmx p){

        dao.add(p);
    }

    public void deletedh(String dh){

       dao.deletedh(dh);
    }


}
