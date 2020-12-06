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
 * 清单明细方法封装了主要的增加删除修改
 */
@Repository("qdmxDao")
public interface qdmxDao {

    /*
查所有
return List<qdmx>
 */
    public List<Map> getAll(Map map);

    /*
    根据ID查询
    {id} 要查询qdmx的 id
     */
    public qdmx getqdmxByID(int id);

    /*
    删除
    {id} 要删除清单明细的 id
     */
    public void delete(int id);

    /*
    更新
    {p} 要更新qdmx实例
     */
    public void update(qdmx p);

    /*
    增加
    {p} 要新增的qdmx实例
     */
    public void add(qdmx p);

    public void deletedh(String dh);


}
