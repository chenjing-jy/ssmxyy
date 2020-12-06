package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import com.model.*;

import java.util.List;
import java.util.Map;

/**
 * 病床方法封装了主要的增加删除修改
 */
@Repository("bingchuangDao")
public interface bingchuangDao {
    /*
查所有
return List<bingchuang>
 */
    public List<Map> getAll(Map map) ;

    /*
    根据ID查询
    {id} 要查询bingchuang的 id
     */
    public bingchuang getbingchuangByID(int id) ;

    /*
    删除
    {id} 要删除病床的 id
     */
    public void delete(int id);
    /*
    更新
    {p} 要更新bingchuang实例
     */
    public void update(bingchuang p);

    /*
    增加
    {p} 要新增的bingchuang实例
     */
    public void add(bingchuang p) ;

    public List<Map> noRepeat(String bc) ;

}
