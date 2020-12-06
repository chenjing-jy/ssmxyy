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
 * 工作时间安排方法封装了主要的增加删除修改
 */
@Repository("gzsjapDao")
public interface gzsjapDao {

    /*
查所有
return List<gzsjap>
 */
    public List<Map> getAll(Map map);

    /*
    根据ID查询
    {id} 要查询gzsjap的 id
     */
    public gzsjap getgzsjapByID(int id);

    /*
    删除
    {id} 要删除工作时间安排的 id
     */
    public void delete(int id);

    /*
    更新
    {p} 要更新gzsjap实例
     */
    public void update(gzsjap p);

    /*
    增加
    {p} 要新增的gzsjap实例
     */
    public void add(gzsjap p);


}
