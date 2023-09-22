<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
JsonObject jsonObject = new JsonObject();
jsonObject.addProperty("id", "hong1");
jsonObject.addProperty("pw", "1111");

JsonObject jsonObject2 = new JsonObject();
jsonObject2.addProperty("id", "hong2");
jsonObject2.addProperty("pw", "2222");

JsonArray jsonArray = new JsonArray();
jsonArray.add(jsonObject);
jsonArray.add(jsonObject2);

out.print(jsonArray.toString());
%>    
