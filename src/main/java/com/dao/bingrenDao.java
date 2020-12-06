package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import com.model.*;

import java.util.List;
import java.util.Map;

/**
 * 病人方法封装了主要的增加删除修改
 */
@Repository("bingrenDao")
public interface bingrenDao {

    /*
查所有
return List<bingren>
 */
    public List<Map> getAll(Map map);

    /*
    根据ID查询
    {id} 要查询bingren的 id
     */
    public bingren getbingrenByID(int id);

    /*
    根据姓名查询
    {id} 要查询bingren的 姓名
     */
    public bingren getbingrenByXm(String xm);

    /*
    删除
    {id} 要删除病人的 id
     */
    public void delete(int id);

    /*
    更新
    {p} 要更新bingren实例
     */
    public void update(bingren p);

    /*
    增加
    {p} 要新增的bingren实例
     */
    public void add(bingren p);


    public String selectByxm(int id);

    public String selectxmByid(int id);


    public List<Map> noXMRepeat(String xm);


}
