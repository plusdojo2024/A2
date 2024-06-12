<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/>
 <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
 <script>
    jQuery(function($){
    	 // デフォルトの設定を変更（日本語化）--------------------
        $.extend( $.fn.dataTable.defaults, {
            language: {
                url: "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Japanese.json"
            }
        });
    	 //------------------------------------------------
    	//データテーブルを使用
        $("#foo-table").DataTable();
    });
 </script>
<meta charset="UTF-8">
<title>絞り込みサンプル</title>
</head>
<body>
	<h1>DataTablesサンプル</h1>
	<table border="1" id="foo-table" class="table table-bordered">
		<thead>
			<tr>
				<th>従業員番号</th>
				<th>従業員名</th>
				<th>年齢</th>
				<th>性別</th>
				<th>保有免許</th>
				<th>部署</th>
				<th>メッセージ</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="e" items="${list}" varStatus="status">
				<tr>
					<td>${e.empId}</td>
					<td>${e.empName}</td>
					<td>${e.empAge}</td>
					<td>${e.gender}</td>
					<td>${e.license}</td>
					<td>${e.department}</td>
					<td>${e.message}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>