package com.service;

import com.dao.yzqdDao;
import com.model.yzqd;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class yzqdService {
    @Autowired
    private yzqdDao dao;

    /*
查所有
return List<yzqd>
*/
    public List<Map> getAll(Map map){

        return dao.getAll(map);
    }

    /*
    根据ID查询
    {id} 要查询yzqd的 id
     */
    public yzqd getyzqdByID(int id){


        return dao.getyzqdByID(id);
    }
    /*
    根据姓名查询
    {br} 要查询yzqd的 姓名
     */
    public  yzqd getyzqdByXm(String xm){


        return dao.getyzqdByXm(xm);
    }

    /*
    删除
    {id} 要删除医嘱清单的 id
     */
    public void delete(int id){

        dao.delete(id);
    }

    /*
    更新
    {p} 要更新yzqd实例
     */
    public  void update(yzqd p){

        dao.update(p);
    }

    /*
    增加
    {p} 要新增的yzqd实例
     */
    public void add(yzqd p){

        dao.add(p);
    }



    public String findDeldh(int id){

        return  dao.findDeldh(id);
    }


    public List<Map> selectyzqd(String xm){

        return dao.selectyzqd(xm);
    }

    public void updateyzqdxm(yzqd p){

        dao.updateyzqdxm(p);
    }


    public List<Map> noRepeat(String xm){

        return dao.noRepeat(xm);
    }

    public List<Map> noDelInHos(String br){

        return dao.noDelInHos(br);
    }

    public String selectBybc(int bc) {

        return  dao.selectBybc(bc);
    }
}
