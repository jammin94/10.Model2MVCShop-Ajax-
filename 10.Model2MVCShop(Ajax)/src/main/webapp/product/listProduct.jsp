<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

function fncGetProductList(currentPage){
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();	
}

$(function() {
	

	//�˻� ����
	$( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
		fncGetProductList(1);
	});
	
	//���� getProduct ����
	window.onscroll=function() {
			console.log(window.scrollMaxY);
			console.log(window.screenY);
		/*
			var prodNo = $(this).text().trim();
			
			$.ajax( 
					{
						url : "/product/json/getProduct/"+prodNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

							var displayValue = "<h3>"
								+"<img src=/images/uploadFiles/"+JSONData.fileName+" align=absmiddle/><br/>"
								+"</h3>";
							$("h3").remove();
							$( "#"+prodNo+"" ).html(displayValue);
							}
				});
			*/
			
				////////////////////////////////////////////////////////////////////////////////////////////
			
	});

});	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

 
 <form name="detailForm" action="/product/listProduct" method="post">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">

					��ǰ�˻�
					 
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">

			 <c:choose>
		 		<c:when test="${search.searchCondition =='0' || search.searchCondition == null}">
		 			<option value="0" selected>��ǰ��ȣ</option>
		 			<option value="1">��ǰ��</option>
		 			<option value="2">��ǰ����</option>
		 		</c:when>
		
		 		<c:when test="${search.searchCondition =='1'}">
		 			<option value="0">��ǰ��ȣ</option>
		 			<option value="1" selected>��ǰ��</option>
		 			<option value="2">��ǰ����</option>
		 		</c:when>
		 		
		 		<c:when test="${search.searchCondition =='2'}">
		 			<option value="0">��ǰ��ȣ</option>
		 			<option value="1">��ǰ��</option>
		 			<option value="2" selected>��ǰ����</option>
		 		</c:when>

			 </c:choose>
			 
			</select>
			<input 	type="text" name="searchKeyword"  value="${! empty search.searchKeyword ? search.searchKeyword : "" }"
							class="ct_input_g" style="width:200px; height:19px" >
		</td>
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList(1);">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			
			</table>
			<td align="left">
		<input type="radio" id="Desc" name="Order" value="Desc">
		<label for="Desc">���� ������</label>
		<input type="radio" id="Asc" name="Order" value="Asc">
		<label for="Asc">���� ������</label>
	</td>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >

		 ��ü  ${resultPage.totalCount} �Ǽ�,	���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����������(Ŭ��)</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>
		<td class="ct_line02"></td>	
	</tr>
	<tr>
		<td colspan="13" bgcolor="808285" height="1"></td>
	</tr>

	<c:forEach var="i" items= "${list}" varStatus="status" >
		<tr class="ct_list_pop">
		<td align="center">${status.count}</td>
		<td></td>
				<td align="left"><a href="/product/getProduct/${i.prodNo}">${i.prodName}</a></td>
		<td></td>
		<td align="left">${i.price}</td>
		<td></td>
		<td align="left">${i.regDate}</td>
		<td></td>
		<td align="left">${i.prodNo}</td>
		<td></td>
		<td align="left">
			�Ǹ���
			<%--�ϴ��� �Ǹ������θ� �صѰ�. �� �κп� menu=manage�� ���� ���ſϷ� ������ �Ϳ� ���Ͽ� ���� ����ϱ� ��ư �������.--%>
		</td>		
	</tr>
	<tr>
			<!-- //////////////////////////// �߰� , ����� �κ� /////////////////////////////
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			////////////////////////////////////////////////////////////////////////////////////////////  -->
			<td id="${i.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>
	
	


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
				
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<c:choose>
		 	<c:when test="${resultPage.currentPage<=resultPage.pageUnit}">
		 		
		 	</c:when>
		 	<c:otherwise>
		 		<a href="javascript:fncGetProductList('${resultPage.beginUnitPage-1}')">����</a>
		 	</c:otherwise>
		 </c:choose>
		 
		 <c:forEach var="i" begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage }" varStatus="status">
		 	<a href="javascript:fncGetProductList('${i }');">${i }</a>
		 </c:forEach>
		 
		 <c:choose>
		 	<c:when test="${resultPage.endUnitPage>=resultPage.maxPage}">
		 		
		 	</c:when>
		 	<c:otherwise>
		 		<a href="javascript:fncGetProductList('${resultPage.endUnitPage+1}')">����</a>
		 	</c:otherwise>
		 </c:choose>
    	</td>
	</tr>
</table>

<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
