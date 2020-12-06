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
 * 新闻方法封装了主要的增加删除修改
 */
@Repository("xinwenDao")
public interface xinwenDao {

    /*
查所有
return List<xinwen>
 */
    public List<Map> getAll(Map map);

    /*
    根据ID查询
    {id} 要查询xinwen的 id
     */
    public xinwen getxinwenByID(int id);

    /*
    删除
    {id} 要删除新闻的 id
     */
    public void delete(int id);

    /*
    更新
    {p} 要更新xinwen实例
     */
    public void update(xinwen p);

    /*
    增加
    {p} 要新增的xinwen实例
     */
    public void add(xinwen p);


}
