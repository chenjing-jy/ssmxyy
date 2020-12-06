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
 * 医生方法封装了主要的增加删除修改
 */
@Repository("yishengDao")
public interface yishengDao {

    /*
查所有
return List<yisheng>
 */
    public List<Map> getAll(Map map);

    /*
    根据ID查询
    {id} 要查询yisheng的 id
     */
    public yisheng getyishengByID(int id);

    /*
    删除
    {id} 要删除医生的 id
     */
    public void delete(int id);

    /*
    更新
    {p} 要更新yisheng实例
     */
    public void update(yisheng p);

    /*
    增加
    {p} 要新增的yisheng实例
     */
    public void add(yisheng p);


    public List<Map> noRepeat(String yhm);


}
