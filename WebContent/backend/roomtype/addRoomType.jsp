<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增房型</title>
</head>
<style>
#preview {
	height: 300px;
	width: 80%;
	border: 1px solid #495464;
	margin: 0 auto;
	display: inline-flex;
	flex-direction: row;
	flex-wrap: wrap;
	overflow: scroll;
	justify-content: center;
}

img {
	width: 200px;
	margin: 5px;
	border: 2px solid transparent;
}

.previewImg {
	
}
</style>
<body>
	<form method="post" id="rmtypeform" enctype="multipart/form-data">
		<div class="insert-rm-type">
			<label for="rm_type"><p>房型編號</p> <input type="text"
				name="rm_type" class="rm-input" id="rm_type" pattern="\d*"
				maxlength="1" autocomplete="off" placeholder="請選擇1-9的數字" required /></label>
			<label for="type_name"><p>房型名稱</p> <input type="text"
				name="type_name" class="rm-input" id="type_name" maxlength="10"
				autocomplete="off" required /></label> <label for="rm_price"><p>房型價格</p>
				<input type="text" name="rm_price" class="rm-input" pattern="\d*"
				id="rm_price" maxlength="10" autocomplete="off" required /></label> <label
				for="rm_capacity"><p>最大入住人數</p> <select name="rm_capacity"
				class="rm-select" id="rm_capacity" required>
					<option value="2">2</option>
					<option value="4">4</option>
					<option value="6">6</option>
			</select></label> <label for="rm_info"><p>客房介紹</p> <textarea name="rm_info"
					class="rm-input" id="rm_info" maxlength="500" placeholder="最多500字"
					required></textarea> </label> <label for="pic-upload"><p>上傳客房照片</p>
				<div class="pic-upload" name="pic-upload" for="rm-pic">
					<h6>
						<i class="icon fas fa-cloud-upload-alt"></i>上傳照片
					</h6>
					<input type="file" accept="image/*" name="rm_pic" class="rm-input"
						id="rm_pic" multiple />
				</div></label> <input name="action" value="insert_rm_type"
				style="visibility: hidden" /> <label for="preview"
				style="text-align: center">上傳圖片預覽</label>
			<div id="preview" namem="preview"></div>
		</div>

		<button type="submit" class="sendRmTypeData">確認送出</button>
	</form>

	<script>
	$(document).ready(function () {
			
            let formElem = document.querySelector("#rmtypeform");
            formElem.addEventListener("submit", (e) => {
                e.preventDefault();
               
                let data = new FormData(formElem);
                let xhr = new XMLHttpRequest();
                xhr.open("post", "${pageContext.request.contextPath}/RoomTypeServlet");
                xhr.onload = function () {
                    if (xhr.readyState === xhr.DONE) {
                        if (xhr.status === 200) {
                            if (xhr.responseText === "新增成功") {
                                Swal.fire({
                                    position: "top-end",
                                    icon: "success",
                                    title: xhr.responseText,
                                    showConfirmButton: false,
                                    timer: 1500,
                                });
                                setTimeout(function () {
                                    location.reload();
                                }, 1400);
                            } else if (xhr.responseText === "編號重複") {
                                Swal.fire({
                                    position: "top-end",
                                    icon: "error",
                                    title: xhr.responseText,
                                    showConfirmButton: false,
                                    timer: 1500,
                                });
                            }
                        }
                    }
                };
                xhr.send(data);
            });
            
            var myFile = document.getElementById("rm_pic");
            var filename = "";
            var content = document.getElementById("preview-display");
			var thefiles;
            myFile.addEventListener("change", function () { //預覽要上傳的照片
            	 let inputfiles = document.getElementById("rmpic");
                if (this.files) {
                    thefiles = this.files;
                    for (let i = 0; i < thefiles.length; i++) {
                        if (thefiles[i].type.indexOf("image") >= 0) {
                            let reader = new FileReader();
							
                            reader.addEventListener("load", (ex) => {
                                let div = document.createElement("div");
                                let img = document.createElement("img");
                                let checkbox = document.createElement("checkbox")
                                img.src = ex.target.result;
                                preview.append(div);
                                div.append(img);
                                
                            });
                            reader.readAsDataURL(thefiles[i]);
                           
                        } else {
                            window.close();
                        }
                    }
                }
            });
            
            
		});
        </script>
</body>
</html>