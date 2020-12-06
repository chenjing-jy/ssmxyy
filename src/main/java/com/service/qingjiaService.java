package com.service;

import com.dao.qingjiaDao;
import com.model.qingjia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class qingjiaService {
    @Autowired
    private qingjiaDao dao;

    /*
查所有
return List<qingjia>
*/
    public List<Map> getAll(Map map){

        return dao.getAll(map);
    }

    /*
    根据ID查询
    {id} 要查询qingjia的 id
     */
    public qingjia getqingjiaByID(int id){


        return dao.getqingjiaByID(id);
    }

    /*
    删除
    {id} 要删除请假的 id
     */
    public void delete(int id){

        dao.delete(id);
    }

    /*
    更新
    {p} 要更新qingjia实例
     */
    public  void update(qingjia p){

       dao.update(p);
    }

    /*
    增加
    {p} 要新增的qingjia实例
     */
    public void add(qingjia p){

        dao.add(p);
    }


}
