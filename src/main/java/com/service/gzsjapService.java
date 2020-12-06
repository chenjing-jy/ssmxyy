package com.service;

import com.dao.gzsjapDao;
import com.model.gzsjap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class gzsjapService {

    @Autowired
    private gzsjapDao dao;

    /*
查所有
return List<gzsjap>
*/
    public List<Map> getAll(Map map) {

        return dao.getAll(map);
    }

    /*
    根据ID查询
    {id} 要查询gzsjap的 id
     */
    public gzsjap getgzsjapByID(int id) {


        return dao.getgzsjapByID(id);
    }

    /*
    删除
    {id} 要删除工作时间安排的 id
     */
    public void delete(int id) {

        dao.delete(id);
    }

    /*
    更新
    {p} 要更新gzsjap实例
     */
    public void update(gzsjap p) {

        dao.update(p);
    }

    /*
    增加
    {p} 要新增的gzsjap实例
     */
    public void add(gzsjap p) {

        dao.add(p);
    }


}
