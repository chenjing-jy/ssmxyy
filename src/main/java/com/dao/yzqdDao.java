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
 * 医嘱清单方法封装了主要的增加删除修改
 */
@Repository("yzqdDao")
public interface yzqdDao {

    /*
查所有
return List<yzqd>
 */
    public List<Map> getAll(Map map);

    /*
    根据ID查询
    {id} 要查询yzqd的 id
     */
    public yzqd getyzqdByID(int id);

    /*
    根据姓名查询
    {br} 要查询yzqd的 姓名
     */
    public yzqd getyzqdByXm(String xm);

    /*
    删除
    {id} 要删除医嘱清单的 id
     */
    public void delete(int id);

    /*
    更新
    {p} 要更新yzqd实例
     */
    public void update(yzqd p);

    /*
    增加
    {p} 要新增的yzqd实例
     */
    public void add(yzqd p);


    public String findDeldh(int id);


    public List<Map> selectyzqd(String xm);

    public void updateyzqdxm(yzqd p);


    public List<Map> noRepeat(String xm);

    public List<Map> noDelInHos(String br);

    public String selectBybc(int bc);
}
