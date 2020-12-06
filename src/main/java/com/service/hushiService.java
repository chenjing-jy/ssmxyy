package com.service;

import com.dao.hushiDao;
import com.model.hushi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class hushiService {
    @Autowired
    private hushiDao dao;

    /*
查所有
return List<hushi>
*/
    public List<Map> getAll(Map map){

        return dao.getAll(map);
    }

    /*
    根据ID查询
    {id} 要查询hushi的 id
     */
    public hushi gethushiByID(int id){


        return dao.gethushiByID(id);
    }

    /*
    删除
    {id} 要删除护士的 id
     */
    public void delete(int id){

        dao.delete(id);
    }

    /*
    更新
    {p} 要更新hushi实例
     */
    public  void update(hushi p){

       dao.update(p);
    }

    /*
    增加
    {p} 要新增的hushi实例
     */
    public void add(hushi p){

        dao.add(p);
    }

    public List<Map> noRepeat(String yhm) {

        return dao.noRepeat(yhm);
    }




}
