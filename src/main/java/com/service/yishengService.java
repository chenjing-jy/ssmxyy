package com.service;

import com.dao.yishengDao;
import com.model.yisheng;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class yishengService {
    @Autowired
    private yishengDao dao;

    /*
查所有
return List<yisheng>
*/
    public List<Map> getAll(Map map){

        return dao.getAll(map);
    }

    /*
    根据ID查询
    {id} 要查询yisheng的 id
     */
    public yisheng getyishengByID(int id){


        return dao.getyishengByID(id);
    }

    /*
    删除
    {id} 要删除医生的 id
     */
    public void delete(int id){

        dao.delete(id);
    }

    /*
    更新
    {p} 要更新yisheng实例
     */
    public  void update(yisheng p){

       dao.update(p);
    }

    /*
    增加
    {p} 要新增的yisheng实例
     */
    public void add(yisheng p){

       dao.add(p);
    }


    public List<Map> noRepeat(String yhm) {

        return dao.noRepeat(yhm);
    }


}
