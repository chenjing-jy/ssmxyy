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
 * 公告方法封装了主要的增加删除修改
 */
@Repository("gonggaoDao")
public interface gonggaoDao {

    /*
查所有
return List<gonggao>
 */
    public List<Map> getAll(Map map);

    /*
    根据ID查询
    {id} 要查询gonggao的 id
     */
    public gonggao getgonggaoByID(int id);

    /*
    删除
    {id} 要删除公告的 id
     */
    public void delete(int id);

    /*
    更新
    {p} 要更新gonggao实例
     */
    public void update(gonggao p);

    /*
    增加
    {p} 要新增的gonggao实例
     */
    public void add(gonggao p) ;


}
