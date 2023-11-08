<%-- 
    Document   : Update
    Created on : Oct 31, 2023, 10:24:52 AM
    Author     : Nhu Huynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <!--        <link rel="stylesheet" href="./CSS/update.css">-->
        <link rel="stylesheet" href="./CSS/update.css">
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
                            <div class=" col-sm-4 ">
                                <a href="editProfile.jsp" class="btn"><i class="fa-solid fa-pencil"></i>&nbsp; Profile</a>
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
                        <form action="update" method="POST">
                            <div class="container-fluid row">
                                <div class="row col-sm-4">
                                    <div class="row upload-card">
                                        <div class="form-upload">
                                            <label for="file">
                                                <div class="input-file">
                                                    <h1><i class="fa-solid fa-cloud-arrow-up"></i></h1>
                                                    <h2>Select video</h2>
                                                    <div>
                                                        <span>Or drag and drop a file </span>
                                                    </div>
                                                    <div>
                                                        <span>MP4 or Webm</span>
                                                    </div>
                                                    <div>
                                                        <span>720x1280 resolution or higher </span>
                                                    </div> 
                                                    <div>
                                                        <span>Up to 10 minutes</span>
                                                    </div>
                                                    <div> 
                                                        <span>Less than 10 GB</span>
                                                    </div>
                                                    <div>
                                                        <div class="file-input-wrapper">
                                                            <span id="fileLabel">Choose file</span>
                                                            <input type="file" id="file" accept=".mp4,.webm" name="urlVideo" required>
                                                        </div>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row col-sm-8">
                                    <div class="upload-caption">
                                        <div class="form-group">
                                            <label>Caption</label>
                                            <input type="text" class="form-control" name="caption" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Name of music:</label>
                                            <div>
                                                <input type="text" class="form-control" name="nameOfMusic" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Type of music:</label>
                                            <div class="checkbox-group">
                                                <div class="checkbox-column">
                                                    <label>
                                                        <input type="checkbox" id="check" name="videoType" value="bl"> Ballad
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" id="check" name="videoType" value="blr"> Bolero
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" id="check" name="videoType" value="cls"> Classic
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" id="check" name="videoType" value="cmd"> Comady
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" id="check" name="videoType" value="edm"> EDM
                                                    </label>
                                                </div>
                                                <div class="checkbox-column">
                                                    <label>
                                                        <input type="checkbox" id="check" name="videoType" value="lf"> Lofi
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" id="check" name="videoType" value="pe"> Thơ
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" id="check" name="videoType" value="rap"> Rap
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" id="check" name="videoType" value="rk"> Rock
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" id="check" name="videoType" value="rm"> Remix
                                                    </label>
                                                </div>
                                            </div>
                                        </div>                                
                                    </div>
                                    <div class="button-row">
                                        <div class="btn-cancel">
                                            <button onclick="window.location.href = 'PersonalVideoServlet';"> Cancel</button>
                                        </div>
                                        <div class="btn-post"  type="submit">
                                            <button>
                                                <div>Post</div>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </aside>
                </div>
            </div>
        </div>
        <!--        kiểm tra file đã được cập nhật chưa-->
        <script>
            const fileInput = document.getElementById('file');
            const fileLabel = document.getElementById('fileLabel');

            fileInput.addEventListener('change', function () {
                if (fileInput.files.length > 0) {
                    fileLabel.textContent = 'Update success';
                    const fileUrl = URL.createObjectURL(fileInput.files[0]);
                    const fileUrlElement = document.createElement('p');
                    fileUrlElement.textContent = 'File URL: ' + fileUrl;
                    fileLabel.parentNode.appendChild(fileUrlElement);
                } else {
                    fileLabel.textContent = 'No file chosen';
                }
            });
        </script>
        <script>
            const fileInput = document.getElementById('file');
            const fileLabel = document.getElementById('fileLabel');
            let previousFileUrl = null;
            fileInput.addEventListener('change', function () {
                if (fileInput.files.length > 0) {
                    if (previousFileUrl) {
                        URL.revokeObjectURL(previousFileUrl);
                        previousFileUrl = null;
                    }

                    fileLabel.textContent = 'Update success';
                    const fileUrl = URL.createObjectURL(fileInput.files[0]);
                    const fileUrlElement = document.createElement('p');
                    fileUrlElement.textContent = 'File URL: ' + fileUrl;
                    fileLabel.parentNode.appendChild(fileUrlElement);

                    previousFileUrl = fileUrl;
                } else {
                    fileLabel.textContent = 'No file chosen';
                    if (previousFileUrl) {
                        URL.revokeObjectURL(previousFileUrl);
                        previousFileUrl = null;
                    }
                }
            });
            window.addEventListener('beforeunload', function () {
                if (previousFileUrl) {
                    URL.revokeObjectURL(previousFileUrl);
                }
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
