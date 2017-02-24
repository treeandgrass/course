package com.cqut.generalCourse.dao;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
* ��Ŀ��ƣ�recruitPortal
* ����ƣ�ListMapHander
* �������� ʵ��<code>ResultSetHander</code>�ӿ�,���ڽ����ÿһ������ĵķ���Map<String,Object>�У�Ȼ���ڽ����Map����List�С�
* @version 1.0
* Copyright (c) 2014 ChongQing University Of Technology
 */
public class ListMapHander implements ResultSetHander {

	@Override
	public Object doHander(ResultSet rs) throws SQLException {
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>(); 
		ResultSetMetaData rsmd = rs.getMetaData();
        int cols = rsmd.getColumnCount();
        
        HashMap<String,Object> m = null;
        
        //System.out.println("list ���");
        //������
        while(rs.next()){
        	m = new HashMap<String,Object>();
        	//������е���ݱ��浽HashMap��
        	for (int i = 1; i <= cols; i++) {
        		//System.out.println("Label:"+rsmd.getColumnLabel(i));
        		//System.out.println(rsmd.getColumnName(i)+","+rs.getObject(i));
				m.put(rsmd.getColumnLabel(i), rs.getObject(i));
			}
        	resultList.add(m);
        }
		return resultList;
	}
	
	
	

}
