<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>multiFile.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
    input[type=file] {
      display: none;
    }
    .myBtn {
      display: inline-block;
      width: 200px;
      text-align: center;
      padding: 10px;
      background-color: #09A;
      color: #fff;
      text-decoration: none;
      border-radius: 5px;
    }

    .imgsWrap {
      border: 2px solid #A8A8A8;
      margin-top: 30px;
      margin-bottom: 30px;
      padding-top: 10px;
      padding-bottom: 10px;
    }
    .imgsWrap img {
      max-width: 150px;
      margin-left: 10px;
      margin-right: 10px;
    }
  </style>
	<script>
	  'use strict';
	  
	  // 이미지 정보들을 담을 배열
    var imgFiles = [];

    $(document).ready(function() {
      // 아이디 'inputImgs'의 내용이 변경되면 'imgsWrap'클래스를 초기화하고, 변경된 파일의 정보를 배열에 담아준다.
      $("#inputImgs").on("change", function(e){
        // 이미지 정보들을 초기화
        imgFiles = [];
        $(".imgsWrap").empty();

        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        var idx = 0;
        filesArr.forEach(function(f) {
          if(!f.type.match("image.*")) {
            alert("확장자는 이미지파일 확장자만 가능합니다.");
            return;
          }
          imgFiles.push(f);

          var reader = new FileReader();
          reader.onload = function(e) {
            var html = "<a href='javascript:void(0);' onclick='deleteImageAction("+idx+")' id='imgId_"+idx+"'><img src='" + e.target.result + "' data-file='"+f.name+"' class='selProductFile' title='이미지를 클릭하시면 제거됩니다.("+idx+")'></a>";
            $(".imgsWrap").append(html);
            idx++;
          }
          reader.readAsDataURL(f);
        });
      });
    });

    // '이미지 불러오기' 버튼을 클릭하면 아이디 'inputImgs'(file속성 태그)를 클릭하게하여 파일 브라우저창이 뜨게한다.
    function imageUploadAction() {
      $("#inputImgs").trigger('click');
    }

    // 그림을 클릭하면 이미지가 삭제되게 처리한다.
    function deleteImageAction(idx) {
			console.log("전",imgFiles);
      imgFiles.splice(idx, 1);  // 배열안의 해당 인덱스번지의 내용을 배열에서 제거시킨다.
			console.log("후",imgFiles);

      var imgId = "#imgId_"+idx;
      $(imgId).remove(); 
    }

    function submitAction() {
      if(imgFiles.length < 1) {
        alert("한개이상의 파일을 선택해주세요.");
        return;
      }
      
      var imgNames = "";
			for(var i=0; i<imgFiles.length; i++) {
        imgNames += imgFiles[i].name + "/";
      }
			imgNames = imgNames.substring(0,imgNames.length-1);
			alert(imgNames);
			$("#imgNames").val(imgNames);
      myform.submit();
    }
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
  <div>
    <h2><b>이미지 미리보기</b></h2>
    <div class="input_wrap">
      <form name="myform" method="post" enctype="multipart/form-data">
	      <a href="javascript:imageUploadAction();" class="myBtn">이미지불러오기</a> (사진을 불러오신후, 이미지 미리보기 사진을 클릭하시면 미리보기에서 제거됩니다.)
	      <input type="file" name="file" id="inputImgs" multiple/>
	      <input type="hidden" name="imgNames" id="imgNames"/>
      </form>
    </div>
    </div>

    <div>
      <div class="imgsWrap">
        <img id="img" />
      </div>
    </div>

    <a href="javascript:submitAction();" class="btn btn-success">파일업로드</a>&nbsp;
    <a href="javascript:location.reload();" class="btn btn-warning">다시선택</a>&nbsp;
    <a href="${ctp}/study/fileUpload/fileUpload" class="btn btn-primary">저장된파일보기</a>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>