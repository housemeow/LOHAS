
    var isPlay = true;
    function playButton_onclick() {
        document.getElementById("tripMediaPlayer").play();
        isPlay = true;
    }

    function pauseButton_onclick() {
        if(isPlay){
            document.getElementById("tripMediaPlayer").pause();
            isPlay = false;
        }else{
            playButton_onclick();
        }
    }

    function stopButton_onclick() {
        document.getElementById("tripMediaPlayer").stop();
        document.getElementById("tripMediaPlayer").play();
        document.getElementById("tripMediaPlayer").pause();
        isPlay = false;
    }