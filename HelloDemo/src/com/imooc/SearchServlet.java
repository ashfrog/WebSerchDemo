package com.imooc;

import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/7/4.
 */
public class SearchServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String keyword = req.getParameter("keywords");
        List<String> listData = getData(keyword);
        System.out.println(JSONArray.fromObject(listData));
        resp.getWriter().write(JSONArray.fromObject(listData).toString());
        //super.doGet(req, resp);
    }
    static List<String> datas = new ArrayList<String>();
    static {
        datas.add("ajax");
        datas.add("ajax post");
        datas.add("ajax new");
        datas.add("ajax new1");
        datas.add("ajax new2");
        datas.add("ajax new3");
    }
    public List<String> getData(String keyword)
    {
        System.out.println(keyword);
        return datas;
    }
}
