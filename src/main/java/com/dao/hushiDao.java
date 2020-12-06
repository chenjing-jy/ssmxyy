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
 * 护士方法封装了主要的增加删除修改
 */
@Repository("hushiDao")
public interface hushiDao {

    /*
查所有
return List<hushi>
 */
    public List<Map> getAll(Map map);

    /*
    根据ID查询
    {id} 要查询hushi的 id
     */
    public hushi gethushiByID(int id);

    /*
    删除
    {id} 要删除护士的 id
     */
    public void delete(int id);

    /*
    更新
    {p} 要更新hushi实例
     */
    public void update(hushi p);

    /*
    增加
    {p} 要新增的hushi实例
     */
    public void add(hushi p);

    public List<Map> noRepeat(String yhm);


}
