<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	$(document).ready(function(){
		$(".reList").load("/board/listReply?bno="+$("#bno").val(),
				function(data){
					$(".reList").html(data);
		});
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".btn-warnig").on("click",function(){
			formObj.attr("action", "/board/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});	
		$(".btn-danger").on("click",function(){
			formObj.attr("action", "/board/remove");
			formObj.submit();
		});	
		$(".btn-primary").on("click",function(){
			self.location="/board/listCri";
		});
		$("#replyAddBtn").click(function(){
			var bno = $("#bno").val();
			var replytext = $("#newReplyText").val();
			var replyer = $("#newReplyWriter").val();
			var subData = "bno="+bno+"&replytext="+replytext+"&pelyer="+replyer;
			$.ajax({
				type:"get",
				url:"/board/addreply",
				data:subData,
				success:function(data){
					$(".reList").html(data);
				},
				error:function(e){
					alert("error:"+e);
				}
			});
		});
		
	});
	function dele(rno,bno){
		if(confirm("정말 삭제하시겠습니까?")){
			$.get("/board/delete?rno="+rno+"&bno="+bno,function(data){$(".reList").html(data);})	
		}
	}
	function page(page,bno){
		$.ajax({
			type:"get",
			url:"/board/listReply",
			data:"page="+page+"&bno="+bno,
			success:function(data){
				$(".reList").html(data);
			}
		});
	}
</script>
</head>
<body>
<%@include file="../include/header.jsp" %>
<form role="form" method="post">
	<input type="hidden" name="bno" id="bno" value="${read.bno}">
</form>
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label>
			<input type="text" name="title" class="form-control"
				value="${read.title}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content"
			rows="3" readonly="readonly">${read.content}</textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label>
			<input type="text" name="writer" class="form-control"
				value="${read.writer}" readonly="readonly">
		</div>
	</div>
	<!-- /.box-body -->
	<div class="box-footer">
		<button type="button" class="btn btn-warnig" >Modify</button>
		<button type="button" class="btn btn-danger">Remove</button>
		<button type="button" class="btn btn-primary">List All</button>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				<div class="box-body">
					<label for="exampleInputEmail1">Writer</label>
					<input class="form-control" type="text" placeholder="USER ID"
					id="newReplyWriter">
					<label for="exampleInputEmail1">Reply</label>
					<input class="form-control" type="text" placeholder="REPLY TEXT"
					id="newReplyText">
				</div>
				<div class="box-footer">
					<button type="button"  id="replyAddBtn">ADD REPLY</button>
				</div>
			</div>
		</div>
	</div>
	<!-- The time line -->
	<div class="reList"></div>
	<div class="text-center">
		<ul id="pagination" class="pagination pagination-sm no-margin"></ul>
	</div>
	<!-- modal -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					
				</div>
			</div>
		</div>
	</div>
<%@include file="../include/footer.jsp" %>
</body>
</html>