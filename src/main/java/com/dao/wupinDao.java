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
物品方法封装了主要的增加删除修改
*/
@Repository("wupinDao")
public interface wupinDao {

	  /*
  查所有
  return List<wupin>
   */
    public  List<Map> getAll(Map map);

    /*
    根据ID查询
    {id} 要查询wupin的 id
     */
    public  wupin getwupinByID(int id);

    /*
    删除
    {id} 要删除物品的 id
     */
    public void delete(int id);

    /*
    更新
    {p} 要更新wupin实例
     */
    public  void update(wupin p);

    /*
    增加
    {p} 要新增的wupin实例
     */
    public void add(wupin p);


    public List<Map> noRepeat(String wp);



}
