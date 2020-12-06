package com.service;

import com.dao.gonggaoDao;
import com.model.gonggao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class gonggaoService {
    @Autowired
    private gonggaoDao dao;

    /*
查所有
return List<gonggao>
*/
    public List<Map> getAll(Map map) {

        return dao.getAll(map);
    }

    /*
    根据ID查询
    {id} 要查询gonggao的 id
     */
    public gonggao getgonggaoByID(int id) {


        return dao.getgonggaoByID(id);
    }

    /*
    删除
    {id} 要删除公告的 id
     */
    public void delete(int id) {

        dao.delete(id);
    }

    /*
    更新
    {p} 要更新gonggao实例
     */
    public void update(gonggao p) {
        dao.update(p);
    }

    /*
    增加
    {p} 要新增的gonggao实例
     */
    public void add(gonggao p) {

        dao.add(p);
    }

}
