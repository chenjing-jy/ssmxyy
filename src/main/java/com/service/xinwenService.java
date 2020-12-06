package com.service;

import com.dao.xinwenDao;
import com.model.xinwen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class xinwenService {
    @Autowired
    private xinwenDao dao;

    /*
查所有
return List<xinwen>
*/
    public List<Map> getAll(Map map){

        return dao.getAll(map);
    }

    /*
    根据ID查询
    {id} 要查询xinwen的 id
     */
    public xinwen getxinwenByID(int id){


        return dao.getxinwenByID(id);
    }

    /*
    删除
    {id} 要删除新闻的 id
     */
    public void delete(int id){

       dao.delete(id);
    }

    /*
    更新
    {p} 要更新xinwen实例
     */
    public  void update(xinwen p){

        dao.update(p);
    }

    /*
    增加
    {p} 要新增的xinwen实例
     */
    public void add(xinwen p){

        dao.add(p);
    }
}
