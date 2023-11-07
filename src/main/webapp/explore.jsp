<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>


<!--
<div class="col-sm-12 types row">

    <button type="button" class="btn btn-primary type-video-button mr-5">
        <span class="type-video-content">xin chao moi nguoi 111111</span>
    </button>
    <button type="button" class="btn btn-primary type-video-button mr-5">
        <span class="type-video-content">xin chao moi nguoi</span>
    </button>
    <button type="button" class="btn btn-primary type-video-button mr-5">
        <span class="type-video-content">xin chao moi nguoi 333333333333</span>
    </button>
    <button type="button" class="btn btn-primary type-video-button mr-5">
        <span class="type-video-content">xin chao moi nguoi</span>
    </button>   
    <button type="button" class="btn btn-primary type-video-button mr-5">
        <span class="type-video-content">xin chao moi nguoi 111111</span>
    </button>
    <button type="button" class="btn btn-primary type-video-button mr-5">
        <span class="type-video-content">xin chao moi nguoi</span>
    </button>
    <button type="button" class="btn btn-primary type-video-button mr-5">
        <span class="type-video-content">xin chao moi nguoi 333333333333</span>
    </button>
    <button type="button" class="btn btn-primary type-video-button mr-5">
        <span class="type-video-content">xin chao moi nguoi</span>
    </button>  
</div>-->


<div class="row col-sm-11 recommend-videos justify-content-between">
    <c:forEach items="${videos}" var="videoExplore">
        <div class="col-sm-4 recommend-video mb-5">
            <div class="recommend-video-item">
                <video controls class="video_recommend">
                    <source src="${videoExplore.urlVideo}" type="video/mp4">
                </video>
            </div>
            <div class="recommend-video-content mt-2">
                <div class="recommend-video-content-status1 mb-2">${videoExplore.caption}</div>
                <div class="recommend-video-content-status2 row align-items-center justify-content-between">
                    <div class="col-sm-6 row">
                        <div class="col-sm-4 recommend-video-avatar">
                            <img src=${videoExplore.user.avatar} alt="${videoExplore.caption}"/>
                        </div>
                        <div class="col-sm-8 recommend-video-username">${videoExplore.user.username}</div>
                    </div>

                    <div class="col-sm-4">
                        ${videoExplore.numberLike}
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<script>
    let currentVideo = $('.video_recommend').get(0);

    $(document).ready(function () {
        loopAll();
        muteAll();

        $(currentVideo).prop('autoplay', true);
    });

    $("#explore").click(function () {
        unmuteAll();
    }
    );

    function loopAll() {
        $('.video_recommend').each(function () {
            $(this).prop('loop', true);
        });
    }

    function muteAll() {
        $('.video_recommend').each(function () {
            $(this).prop('muted', true);
        });
    }

    function unmuteAll() {
        $('.video_recommend').each(function () {
            $(this).prop('muted', false);
        });
    }

    $('.video_recommend').hover(function () {
        if (currentVideo === this) {
            return;
        }

        $(currentVideo).get(0).currentTime = 0;
        $(currentVideo).get(0).pause();
        currentVideo = this;
        $(currentVideo).get(0).play();
    }, function () {
        if ($(this).prop('paused')) {
            return;
        }

        if ($(this).prop('muted')) {
            muteAll();
        } else {
            unmuteAll();
        }

        $(currentVideo).get(0).play();
    });


</script>

