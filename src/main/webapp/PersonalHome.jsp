<%-- 
    Document   : PersonalHome
    Created on : Oct 25, 2023, 7:45:44 PM
    Author     : Nhu Huynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <title>Stiktify</title>
        <link rel="stylesheet" href="./CSS/personal.css"/>
    </head>
    <body>
        <div id="header">
            <div class=" container-fluid">  
                <div class="row header gradient">
                    <div class=" col-sm-1 header-logo">
                        <img src="image/logo.jpg" alt="We live we love we lie"/>
                    </div>
                    <div class="col-sm-1"></div>
                    <div class=" col-sm-10 row">
                        <div class=" col-sm-8 header-search">                            
                            <form action="Hello">
                                <div class="searchBar">
                                    <div class="input-group input-group-lg">
                                        <input type="text" class="glass search-text form-control form-control-lg bg-transparent text-white"
                                               placeholder="Searching" aria-label="Searching" aria-describedby="Type keywords to search" />
                                        <button type="submit" class="glass search-button input-group-text border-0" id="basic-addon2">
                                            <i class="bi bi-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-sm-4 row user-interact">
                            <div class="col-sm-4 upload">
                                <a class="btn" href="Update.jsp"><i class="fa-solid fa-plus"></i>&nbsp;Upload</a>
                            </div>
                            <div class=" col-sm-4 ">
                                <a href="editProfile" class="btn"><i class="fa-solid fa-pencil"></i>&nbsp; Profile</a>
                            </div>
                            <img class="avatar-header" src="./image/logo.jpg" alt="Avatar">
                        </div>  
                    </div>
                </div>
            </div>
        </div>

        <div id="slider">
            <div class=" container-fluid">
                <div class=" row">
                    <aside class="aside-left  col-sm-2">
                        <nav class="navbar">
                            <div class="navbar-list">
                                <ul>
                                    <li class="h2 mb-4 mt-4"><a href="#" onclick="GoTrending()">Trending</a></li>
                                    <li class="h2"><a href="#" onclick="GoExplore()">Explore</a></li>
                                </ul>
                            </div>
                        </nav>
                        <footer class="row footer">
                            <!-- Footer -->
                            <!-- Copyright -->
                            <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.025);">
                                © 2021 Copyright:
                                <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
                            </div>
                            <!-- Copyright -->
                        </footer>
                        <!-- Footer -->
                    </aside>

                    <aside class="aside-right col-sm-10">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row profile">
                                        <div class="profile-section">
                                            <div class="profile-section">
                                                <div class="profile-avatar">
                                                    <img class="avatar-profile" src="${avatar}" alt="Avatar">
                                                    <div class="user-info">
                                                        <div class="username">${username}</div>
                                                        <div class="bio">${fullname} | Stikify Project</div>
                                                    </div>
                                                </div>
                                                <div class="stats">
                                                    <div class="stats-item">
                                                        <div class="stats-label">Followers</div>
                                                        <div class="stats-value">10k</div>
                                                    </div>
                                                    <div class="stats-item">
                                                        <div class="stats-label">Following</div>
                                                        <div class="stats-value">100</div>
                                                    </div>
                                                    <div class="stats-item">
                                                        <div class="stats-label">Likes</div>
                                                        <div class="stats-value">5k</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="container-fluid mt-5 emotion">
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" id="videos-tab" data-toggle="tab" href="#videos">Video</a>
                                </li>
                                <li class="nav-item favorite">
                                    <a class="nav-link" id="favorites-tab" data-toggle="tab" href="#favorites">
                                        <i class="fa-solid ${lock}"></i>&nbsp; Favorite</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="liked-tab" data-toggle="tab" href="#liked"><i class="fa-solid ${lock}"></i>&nbsp; Liked</a>
                                </li>
                            </ul>

                            <div class="tab-content mt-3">
                                <div class="tab-pane fade show active row" id="videos">
                                    <h2 class="col-sm-12">Videos</h2>
                                    <div class="row col-sm-12"">
                                        <c:forEach items="${videos}" var="video">
                                            <div class="col-sm-3 videos mb-5">
                                                <div class="video-item">
                                                    <video controls class="video_creater">
                                                        <source src="${video.urlVideo}" type="video/mp4">
                                                    </video>
                                                </div>
                                                <div class="video-content-status1 mb-2">${video.caption}</div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <c:if test="${canInteract}">
                                    <div class="tab-pane fade" id="favorites">
                                        <!-- Content for the Favorites tab -->
                                        <h2>Favorites</h2>
                                        <p>Your favorite posts will appear here.</p>
                                    </div>
                                    <div class="tab-pane fade" id="liked">
                                        <!-- Content for the Liked tab -->
                                        <h2>Liked</h2>
                                    </div>
                                </c:if>

                                <c:if test="${!canInteract}">
                                    <div class="tab-pane fade" id="favorites">
                                        <div class="text-center mt-5">
                                            <h2 class="text-danger">You do not have permission to access this content</h2>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="liked">
                                        <div class="text-center mt-5">
                                            <h2 class="text-danger">You do not have permission to access this content</h2>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>

        </div>   
        <!-- Include jQuery and Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="./js/header.js"></script>
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

        </script>
    </body>
</html>
