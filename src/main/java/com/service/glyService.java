package com.service;

import com.dao.glyDao;
import com.model.gly;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class glyService {
    @Autowired
    private glyDao dao;

    /*
查所有
return List<gly>
*/
    public List<Map> getAll(Map map) {

        return dao.getAll(map);
    }

    /*
    根据ID查询
    {id} 要查询gly的 id
     */
    public gly getglyByID(int id) {


        return dao.getglyByID(id);
    }

    /*
    删除
    {id} 要删除管理员的 id
     */
    public void delete(int id) {

        dao.delete(id);
    }

    /*
    更新
    {p} 要更新gly实例
     */
    public void update(gly p) {
        dao.update(p);
    }

    /*
    增加
    {p} 要新增的gly实例
     */
    public void add(gly p) {

        dao.add(p);
    }

    public List<Map> noRepeat(String yhm) {

        return dao.noRepeat(yhm);
    }


}
