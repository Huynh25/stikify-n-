<%-- 
    Document   : Comment
    Created on : Oct 31, 2023, 7:53:59 PM
    Author     : Tran Nguyen Nam Thuan CE171497
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="./CSS/style.css"/>
        <link rel="stylesheet" href="./CSS/comment_style.css"/>
        <title>Comment</title>
    </head>
    <body >
        <div class="container-fluid row">          
            <div id="left-content" class="col-sm-7 row">
                <div  class="col-sm-2"> 
                    <i id="back_trending" class="bi bi-backspace-reverse btn" onclick="goBack()">                      
                    </i>
                </div>
                <video  id="${video.videoID}" class="col-sm-9 video"   style="max-height: 100vh" autoplay controls loop >
                    <source src="${video.urlVideo}" type="video/mp4">                    
                </video> 
                <div class="col-sm-1">
                    <i id ="back-video" class="bi-arrow-up  btn"  style="display: ${display}" onclick="NextVideo('back')" > </i>
                    <i id="next-video" class="bi-arrow-down  btn" onclick="NextVideo('next')"></i>
                </div>                      
            </div>
            <div class="col-sm-5 row">
                <div id="creater_video_content" class="col-sm-12 row" >
                    <div id="account-content" class="col-sm-12 row">
                        <div class="col-sm-8 ava-content">
                            <img src="${video.user.avatar}" alt="${video.user.username}"id="ava-img" />
                            <div id="account-info">
                                <h4 class="content-accountname col-sm-12">${video.user.username}</h4>
                                <h5 class="content-username col-sm-12">${video.user.fullName}</h5>    
                            </div>
                        </div>
                        <div id="follow-btn" class="col-sm-4">
                            <button id="follow-btn-item" class="btn btn-primary">Follow</button>
                        </div>
                    </div>
                    <div id="video-caption" class="col-sm-12" >
                        <h5 class="content-soundname">${video.caption}</h5>
                    </div>
                    <div id="video-name" class="col-sm-12" >
                        <h6 class="content-soundname" style="display: flex"><i class=" content-musicicon bi bi-music-note-beamed"></i><p id="nameOfMusic">${video.nameOfMusic}</p></h6>
                    </div>
                    <div id="video-info" class="col-sm-12 row">
                        <div class="col-sm-4" style="display: flex">
                            <i class=" bi bi-heart-fill"></i>&nbsp<p id="numberView">${video.numberView} Likes</p>
                        </div>
                        <div class="col-sm-4" style="display: flex">
                            <i class="bi bi-headphones"></i>  &nbsp<p id="numberLike"> ${video.numberLike} Views</p>
                        </div >
                        <div class="col-sm-4">
                            <button class=" btn btn-link" onclick="shareLink()" >
                                <i class=" bi bi-share-fill"></i> &nbsp Share
                            </button>
                        </div>

                    </div>
                </div>
                <div id="comment" class="col-sm-12 row" >
                    <div id="comment-btn" class="col-sm-12 row">
                        <div class="col-sm-6" >
                            <button class="btn btn-dark comment-btn-item" id="btn-comment" >Comments</button>
                        </div>
                        <div class="col-sm-6" >
                            <button class="btn btn-dark comment-btn-item" >Creater Videos</button>
                        </div>
                    </div>
                    <hr>
                    <div id="comment-content" class="col-sm-12 row ">
                    </div> 
                </div>                                 
                <div class="col-sm-12" style="height: 3vh"></div>
                <div id="add-comment" class="col-sm-12 row"> 
                    <hr>
                    &nbsp  &nbsp <input  class="col-sm-8"  type="text" placeholder="Add comment" id="add-comment-input" > &nbsp  &nbsp 
                    <button onclick="addComment()" class="col-sm-2 btn btn-primary" id="add-comment-btn" disabled> Post</button>                       
                </div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('add-comment-input').addEventListener('input', function () {
            var commentInput = this.value.trim();
            var postButton = document.getElementById('add-comment-btn');

            if (commentInput !== '') {
                postButton.disabled = false;
            } else {
                postButton.disabled = true;
            }
        });
        var listVideo = [];
        var currentVideo;
        function goBack() {
            window.history.back();
        }
        ;
        function NextVideo(next) {
           
        <c:forEach items="${listVideo}" var="item">
            var video = {
                videoID: '<c:out value="${item.videoID}" />',
                caption: '<c:out value="${item.caption}" />',
                nameOfMusic: '<c:out value="${item.nameOfMusic}" />',
                urlVideo: '<c:out value="${item.urlVideo}" />',
                dateUpload: '<c:out value="${item.dateUpload}" />',
                numberView: '<c:out value="${item.numberView}" />',
                numberLike: '<c:out value="${item.numberLike}" />',
                videoType: '<c:out value="${item.videoType}" />',
                user: {
                    username: '<c:out value="${item.user.username}" />',
                    password: '<c:out value="${item.user.password}" />',
                    email: '<c:out value="${item.user.email}" />',
                    fullName: '<c:out value="${item.user.fullName}" />',
                    gender: '<c:out value="${item.user.gender}" />',
                    birthDate: '<c:out value="${item.user.birthDate}" />',
                    address: '<c:out value="${item.user.address}" />',
                    avatar: '<c:out value="${item.user.avatar}" />'
                }
            };
            listVideo.push(video);
        </c:forEach>
     console.log(listVideo);
            var backOrNext = -1;
            currentVideo = document.getElementsByClassName("video")[0];
            if (next === 'next') {
                backOrNext = 1;
            }
            if (currentVideo.id === listVideo[1].videoID && next === 'back') {
                document.getElementById("back-video").style.display = "none";
            } else if (currentVideo.id === listVideo[0].videoID && next === 'back') {
                var lastVideo = listVideo.length - 1;
                currentVideo.src = listVideo[lastVideo].urlVideo;
                currentVideo.id = listVideo[lastVideo].videoID;
                document.getElementById("ava-img").src = listVideo[lastVideo].user.avatar;
                document.getElementsByClassName("content-accountname")[0].textContent = listVideo[lastVideo].user.username;
                document.getElementsByClassName("content-username")[0].textContent = listVideo[lastVideo].user.fullName;
                document.getElementsByClassName("content-soundname")[0].textContent = listVideo[lastVideo].caption;
                document.getElementById("nameOfMusic").textContent = listVideo[lastVideo].nameOfMusic;
                document.getElementById("numberLike").textContent = "" + listVideo[lastVideo].numberView + " Likes";
                document.getElementById("numberView").textContent = "\t" + listVideo[lastVideo].numberView + " Views";
                return;
            } else {
                document.getElementById("back-video").style.display = "block";
            }

            var n = listVideo.length;
            for (var i = 0; i < n; i++) {
                if (listVideo[i].videoID === currentVideo.id) {
                    currentVideo.src = listVideo[i + backOrNext].urlVideo;
                    currentVideo.id = listVideo[i + backOrNext].videoID;
                    document.getElementById("ava-img").src = listVideo[i + backOrNext].user.avatar;
                    document.getElementsByClassName("content-accountname")[0].textContent = listVideo[i + backOrNext].user.username;
                    document.getElementsByClassName("content-username")[0].textContent = listVideo[i + backOrNext].user.fullName;
                    document.getElementsByClassName("content-soundname")[0].textContent = listVideo[i + backOrNext].caption;
                    document.getElementById("nameOfMusic").textContent = listVideo[i + backOrNext].nameOfMusic;
                    document.getElementById("numberLike").textContent = "" + listVideo[i + backOrNext].numberView + " Views";
                    document.getElementById("numberView").textContent = "\t" + listVideo[i + backOrNext].numberView + " Favorites";
                    break;
                }
            }
            loadComment();
        }
        ;
        function loadComment() {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "comment", true);
            var currentVideoID = document.getElementsByClassName("video")[0].id;
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("currentVideoID=" + currentVideoID);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    var listComment = response;
                    var commentListDiv = document.getElementById("comment-content");
                    commentListDiv.innerHTML = "";
                    document.getElementById("btn-comment").textContent = "(" + listComment.length + ") Comments";
                    if (listComment.length === 0) {
                        var commentElement = document.createElement("h1");
                        commentElement.textContent = "No comment!";
                        commentElement.style = "text-align:center;margin:auto";
                        commentListDiv.appendChild(commentElement);
                    }
                    listComment.forEach(function (comment) {
                        var commentElement = document.createElement("div");
                        commentElement.classList.add("col-sm-12", "comment-ava", "ava-content");
                        commentElement.innerHTML = `
                               <img style="width: 50px;
                             height: 50px;
                             margin: 0 0 0 10px;" src="` + comment.avatar + ` "alt="` + comment.username + `">
                        <div class="comment-chat">
                            <h5 class="content-accountname col-sm-12">` + comment.username + `</h5>
                            <h6 class="content-username col-sm-12">` + comment.cmt + `</h6> 
                            <div>` + comment.dateCmt + `</div>`;
                        commentListDiv.appendChild(commentElement);
                    });
                }
            };
        }
        ;
        window.onload = loadComment;
        function addComment() {
            var add_comment = document.getElementById("add-comment-input").value;
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "comment", true);
            var currentVideoID = document.getElementsByClassName("video")[0].id;

            document.getElementById("add-comment-input").value = "";
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("currentVideoID=" + currentVideoID + "&add_comment=" + add_comment);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {

                }
            };
            loadComment();
              var commentInput = document.getElementById("add-comment-input").value.trim();
            var postButton = document.getElementById('add-comment-btn');

            if (commentInput !== '') {
                postButton.disabled = false;
            } else {
                postButton.disabled = true;
            }
        }
        ;
        document.addEventListener('keydown', function (event) {
            if (event.keyCode === 38) {
                NextVideo('back');
            } else if (event.keyCode === 40) {
                NextVideo('next');
            }
        });
        function shareLink() {
            var urlVideo=document.getElementsByClassName("video")[0].id;
            if (navigator.share) {
                navigator.share({
                    title: "Tiêu đề chia sẻ",
                    text: "Mô tả chia sẻ",
                    url: "http://localhost:8080/Stiktify/comment?videoID=" + urlVideo
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
