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
 * 请假方法封装了主要的增加删除修改
 */
@Repository("qingjiaDao")
public interface qingjiaDao {

    /*
查所有
return List<qingjia>
 */
    public List<Map> getAll(Map map);

    /*
    根据ID查询
    {id} 要查询qingjia的 id
     */
    public qingjia getqingjiaByID(int id);

    /*
    删除
    {id} 要删除请假的 id
     */
    public void delete(int id);

    /*
    更新
    {p} 要更新qingjia实例
     */
    public void update(qingjia p);

    /*
    增加
    {p} 要新增的qingjia实例
     */
    public void add(qingjia p);


}
