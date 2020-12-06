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
 * 管理员方法封装了主要的增加删除修改
 */
@Repository("glyDao")
public interface glyDao {


    public List<Map> getAll(Map map);

    /*
    根据ID查询
    {id} 要查询gly的 id
     */
    public gly getglyByID(int id);

    /*
    删除
    {id} 要删除管理员的 id
     */
    public void delete(int id) ;

    /*
    更新
    {p} 要更新gly实例
     */
    public void update(gly p) ;

    /*
    增加
    {p} 要新增的gly实例
     */
    public void add(gly p);

    public List<Map> noRepeat(String yhm) ;


}
