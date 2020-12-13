        let photo = document.getElementById("photo");
        let preview = document.getElementById('preview');
        photo.addEventListener("change", function() {
            if (this.files) {
                let file = this.files[0];
                console.log(file.type);
                if (file.type.indexOf("image") > -1) {
                    let reader = new FileReader();
                    reader.addEventListener("load", function(e) {
                        console.log(e.target.result);
                        let img = document.createElement("img");
                        img.src = e.target.result;
                        preview.append(img);
                    });
                    reader.readAsDataURL(file);
                } else {

                    alert("請上傳圖片!");
                }
            }
        });