package com.service;

import com.dao.bingrenDao;
import com.model.bingren;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class bingrenService {

    @Autowired
    private bingrenDao dao;

    /*
查所有
return List<bingren>
 */
    public List<Map> getAll(Map map) {

        return dao.getAll(map);
    }

    /*
    根据ID查询
    {id} 要查询bingren的 id
     */
    public bingren getbingrenByID(int id) {


        return dao.getbingrenByID(id);
    }

    /*
    根据姓名查询
    {id} 要查询bingren的 姓名
     */
    public bingren getbingrenByXm(String xm) {


        return dao.getbingrenByXm(xm);
    }

    /*
    删除
    {id} 要删除病人的 id
     */
    public void delete(int id) {

        dao.delete(id);
    }

    /*
    更新
    {p} 要更新bingren实例
     */
    public void update(bingren p) {

        dao.update(p);
    }

    /*
    增加
    {p} 要新增的bingren实例
     */
    public void add(bingren p) {

        dao.add(p);
    }


    public String selectByxm(int id) {

        return dao.selectByxm(id);
    }

    public String selectxmByid(int id) {

        return dao.selectxmByid(id);
    }


    public List<Map> noXMRepeat(String xm) {

        return dao.noXMRepeat(xm);
    }


}
