<%-- 
    Document   : editProfile
    Created on : Nov 7, 2023, 1:15:34 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="./CSS/editStyle.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    </head>
    <body>
        <form action="editProfile" method="POST">
            <!--            <h1>Edit Profile</h1>-->
            <div class="back">
                <a href="PersonalHome.jsp"><i class="fa-solid fa-arrow-right-to-bracket fa-rotate-180"></i>Back</a>
            </div>
            <!--            <h3> <a href="PersonalHome.jsp"><i class="fa-solid fa-arrow-right-to-bracket fa-rotate-180"></i>Back</a></h3>-->
            <section class="vh-100" style="background-color: #f4f5f7;">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col col-lg-6 mb-4 mb-lg-0">
                            <div class="card mb-3" style="border-radius: .5rem;">

                                <!--<c:forEach items="${sessionScope.userEdit}" var="userEdit">-->
                                    <div class="row g-0">
                                        <div class="col-md-4 gradient-custom text-center text-white"
                                             style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">

                                            <div class="file-input-wrapper">
                                                <img src="./Img/avt1.png" alt="Avatar" class="img-fluid my-5" style="width: 80px; " />
                                                <input type="file" id="avatarUpload" accept="image/*"  onclick="uploadAvatar()">
                                            </div>
                                            <center>
                                                <h5>${userEdit.fullname}</h5>Le Nhu Huynh
                                                <p>${userEdit.username}</p> nhuhuynh
                                            </center>

                                        </div>

                                        <div class="col-md-8">
                                            <div class="card-body p-4">
                                                <h6>Information</h6>
                                                <hr class="mt-0 mb-4">
                                                <div class="row pt-1">

                                                    <div class="col-6 mb-3">
                                                        <h6>Email</h6>
                                                        <p class="text-muted">
                                                            <input type="text" name="email" value="${userEdit.email}" readonly="true">
                                                        </p>
                                                    </div>

                                                </div>

                                                <h6>Personal Information</h6>
                                                <hr class="mt-0 mb-4">
                                                <div class="row pt-1">
                                                    <div class="col-6 mb-3">
                                                        <h6>Gender</h6>
                                                        <p class="text-muted">
                                                            <input type="radio" name="gender" value="${userEdit.gender}"> Male
                                                            <br>
                                                            <input type="radio" name="gender"  value="${userEdit.gender}"> Female
                                                        </p>
                                                    </div>

                                                    <div class="col-6 mb-3">
                                                        <h6>Birthdate</h6>
                                                        <p class="text-muted">
                                                            <input type="date" name="birth" value=" ${userEdit.birthdate} "> 
                                                        </p>
                                                    </div>

                                                    <div class="col-12 mb-3">
                                                        <h6>Address</h6>
                                                        <p class="text-muted">
                                                            <input type="text" name="address" value="${userEdit.address}">  
                                                        </p>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="card-footer">
                                                <button class="btn btn-primary" type="submit">Save Changes</button> 
                                                <a class="btn btn-primary" href="PersonalVideoServlet">Cancel</a> 
                                            </div>

                                        </div>
                                    </div>
                                <!--</c:forEach>-->

                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </form>
        <script>
            // jQuery to handle tab switching
            $(document).ready(function () {
                $('.nav-link').on('click', function (e) {
                    e.preventDefault();
                    $(this).tab('show');
                });
            });

            var shouldScroll = true;
            var videos = [];
            function  loadVideo(i) {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "trending?videolength=" + i, true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("videolength=" + i);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var response = JSON.parse(xhr.responseText);
                        var listVideo = response;
                        var videoListDiv = document.getElementById("trending");

                        listVideo.forEach(function (video) {
                            i++;
                            videos.push({id: video.videoID, src: video.urlVideo});
                            var videoElement = document.createElement("div");
                            videoElement.style.display = 'inherit';
                            videoElement.innerHTML = `
                             
                                              <div class=" col-sm-2 "></div>
                                <div class=" col-sm-8 h2 content bg-light row">
                                                       
                                      <form action="PersonalVideoServlet" method="get" class="col-sm-2">
                                     <input type="hidden" name="Username" value="` + video.username + `">
                                       <button type="submit" style="border: none; background: none;" class="row ava-content">
                                        <img src="` + video.avatar + `" alt="` + video.username + `"/>
                                       </button>
                                    </form>
                                    <div class=" col-sm-8">
                                        <div class="col-sm-12 content-accountnameandname">
                                            <h4 class="content-accountname">` + video.username + `</h4>
                                            <h5 class="content-username">` + video.fullname + `</h5> 
                                        </div>
                                        <div class="col-sm-12">
                                            <h5 class="content-soundname">` + video.caption + `</h5>
                                        </div>
                                
                                        <div class="col-sm-12">
                                            <h6 class="content-soundname"><i class=" content-musicicon bi bi-music-note-beamed"></i>` + video.nameOfMusic + `</h6>
                                        </div>
                                        <div class="content-maincontent container-fluid row">
                                            <div class="content-videoandreact col-sm-10 ">
                                                 <video preload="auto" controls loop style="width:300px;height:500px;object-fit: cover;" id="` + video.videoID + `">
                                                    <source src="` + video.urlVideo + `" type="video/mp4">
                                                </video>
                                            </div>
                                    
                                            <div class="d-flex content-react col-sm-2 ">
                                                <div class="col-sm-12">
                                                    <button class=" align-self-center content-btnlike btn btn-primary col-sm-12">
                                                        <i class=" heart-icon bi bi-heart-fill"></i>                                              
                                                    </button>
                                                    <h4 class="col-sm-12" style="padding:10px 0 0 15px;">` + video.numberLike + `</h4>
                 <a href="comment?videoID=` + video.videoID + `" class=" align-self-center content-btnlike btn btn-primary mt-5 col-sm-12">
                                                        <i class=" heart-icon bi bi-chat-fill"></i>
                                                    </a>
                                                   <h4 class="col-sm-12" style="padding:10px 0 0 15px;">` + video.numberOfComment + `</h4>
                                                    <button class=" align-self-center content-btnlike btn btn-primary mt-5 col-sm-12" onclick="shareLink(` + video.videoID + `)">
        <i class=" heart-icon bi bi-share-fill"></i>
                                                    </button>
                                           
                                                </div>
                                            </div>
                                        </div>
                                
                                    </div>
                                    <div class=" col-sm-2 ">
                                            <button class="btn btn-primary">Follow</button>
                                        </div>
                                </div>    
                                <div class=" col-sm-2 "></div>`;
                            videoListDiv.appendChild(videoElement);
                        });
                        if (i === 8) {
                            document.getElementById("trending").style.display = "inherit";
                            document.getElementById("explore").style.display = "none";
                            var video1 = document.getElementById(videos[0].id);
                            video1.play();
                        }
                        ;
                    }
                };
            }
            ;
            function GoTrending() {
                $(currentVideo).get(0).pause();
                $(currentVideo).get(0).currentTime = 0;
                shouldScroll = true;
                var i = videos.length;
                if (i === 0) {
                    i = loadVideo(i);
                } else {
                    document.getElementById("trending").style.display = "inherit";
                    document.getElementById("explore").style.display = "none";
                    var video1 = document.getElementById(videos[0].id);
                    video1.play();
                }
            }
            ;

            function GoExplore() {
                shouldScroll = false;
                for (var i = 0; i < videos.length; i++) {
                    var video = document.getElementById(videos[i].id);
                    video.pause();
                }
                document.getElementById("trending").style.display = "none";
                document.getElementById("explore").style.display = "flex";
                return false;
            }
            ;
            var isScrolling = false;
            window.addEventListener("scroll", function () {
                if (shouldScroll) {
                    var n = videos.length;
                    for (var i = 0; i < n; i++) {
                        var video = document.getElementById(videos[i].id);
                        var videoPosition = video.offsetTop;
                        // Lấy vị trí của cửa sổ cuộn (scroll)
                        var scrollY = window.scrollY + 300;
                        if (scrollY >= videoPosition) {
                            video.play();
                            for (var j = 0; j < i; j++) {
                                var video = document.getElementById(videos[j].id);
                                video.pause();
                            }
                        } else {
                            video.pause();
                        }
                        if (i === n - 1 && scrollY >= videoPosition && !isScrolling) {
                            loadVideo(videos.length);
                            isScrolling = true;
                            setTimeout(function () {
                                isScrolling = false;
                            }, 500);
                        }
                    }
                }
            });
            function shareLink(urlVideo) {
                if (navigator.share) {
                    navigator.share({
                        title: "Tiêu đề chia sẻ",
                        text: "Mô tả chia sẻ",
                        url: "http://localhost:8080/Stiktify/comment?videoID=" + urlVideo.id
                    })
                            .then(function () {
                                console.log("Chia sẻ thành công!");
                            })
                            .catch(function (error) {
                                console.error("Lỗi khi chia sẻ: " + error);
                            });
                } else {
                    alert("Trình duyệt của bạn không hỗ trợ chia sẻ.");
                }
            }
            ;

//upload ảnh
            function uploadAvatar() {
                var avatarInput = document.getElementById("avatarUpload");
                var avatarImage = document.getElementById("avatarImage");

                if (avatarInput.files && avatarInput.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        avatarImage.src = e.target.result;
                    };

                    reader.readAsDataURL(avatarInput.files[0]);
                }
            }

        </script>
    </body>
</html>