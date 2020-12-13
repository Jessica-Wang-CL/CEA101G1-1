<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.roomtype.model.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Add RoomType Pictures</title>
    </head>
    <body>
    	<div>
    		<select id="rmtype">
    				<option disabled selected>選擇要上傳照片的房型</option>
    			<c:forEach var="rmtypevo" items="${rmtypeList}">
    				<option value="${rmtypevo.rm_type}">${rmtypevo.type_name}</option>
    			</c:forEach>
    			
    		</select>
    	</div>
        <div id="dropbox">將圖片拖曳至格線內上傳</div>
        <div id="status"></div>

        <script>
        
        	
        	$("#rmtype").change(function(){
        		console.log("changed")
        		$("#dropbox").css("visibility", "visible");
        		$("#dropbox").css("z-index", "10");
        	})
        		
            window.onload = function () {
                var dropbox = document.getElementById("dropbox");
                dropbox.addEventListener("dragenter", noop, false);
                dropbox.addEventListener("dragleave", noopexit, false);
                dropbox.addEventListener("dragexit", noop, false);
                dropbox.addEventListener("dragover", noop, false);
                dropbox.addEventListener("drop", dropUpload, false);
            };

            function noop(event) {
                event.stopPropagation();
                event.preventDefault();
                dropbox.style.backgroundColor = "rgb(255, 150, 150)";
            }
            function noopexit(event) {
                event.stopPropagation();
                event.preventDefault();
                dropbox.style.backgroundColor = "transparent";
            }

            function dropUpload(event) {
            	noopexit(event);
                var files = event.dataTransfer.files;

                for (var i = 0; i < files.length; i++) {
                    upload(files[i]);
                }
            }

            function upload(file) {
                document.getElementById("status").innerHTML = "Uploading " + file.name;

                var formData = new FormData();
                formData.append("file", file);
                formData.append("action", "addRmPic");
				formData.append("rm_type", document.getElementById("rmtype").value);
                var xhr = new XMLHttpRequest();
                xhr.upload.addEventListener("progress", uploadProgress, false);
                xhr.addEventListener("load", uploadComplete, false);
                xhr.open("POST", "${pageContext.request.contextPath}/RoomPicServlet", true); // If async=false, then you'll miss progress bar support.
                xhr.send(formData);
            }

            function uploadProgress(event) {
                // Note: doesn't work with async=false.
                var progress = Math.round((event.loaded / event.total) * 100);
                document.getElementById("status").innerHTML = "Progress " + progress + "%";
            }

            function uploadComplete(event) {
                document.getElementById("status").innerHTML = event.target.responseText;
            }
        </script>
    </body>
</html>
