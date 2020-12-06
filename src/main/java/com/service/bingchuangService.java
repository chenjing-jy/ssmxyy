package com.service;


import com.dao.bingchuangDao;
import com.model.bingchuang;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class bingchuangService {

    @Autowired
    private bingchuangDao dao;


    /*
查所有
return List<bingchuang>
*/
    public List<Map> getAll(Map map) {

        return dao.getAll(map);
    }

    /*
    根据ID查询
    {id} 要查询bingchuang的 id
     */
    public bingchuang getbingchuangByID(int id) {


        return dao.getbingchuangByID(id);
    }

    /*
    删除
    {id} 要删除病床的 id
     */
    public void delete(int id) {

        dao.delete(id);
    }

    /*
    更新
    {p} 要更新bingchuang实例
     */
    public void update(bingchuang p) {

        dao.update(p);
    }

    /*
    增加
    {p} 要新增的bingchuang实例
     */
    public void add(bingchuang p) {

        dao.add(p);
    }

    public List<Map> noRepeat(String bc) {

        return dao.noRepeat(bc);
    }


}
