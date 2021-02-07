$(document).ready(function(){
    window.addEventListener("message", function(event){
        if(event.data.display == true){
            $('.speedometer').fadeIn();
            $('.speed').text(event.data.speed);
            $('.rpm').html(Math.round(event.data.rpm) + "");
            $('.body').html(Math.round(event.data.body) + "");
            $('.gasoline').text(event.data.gasoline);
            $('.hours').text(event.data.hours);
            $('.minutes').text(event.data.minutes);
            $('.street1').text(event.data.street1);
            $('.street2').text(event.data.street2);
        } else {
            $('.speedometer').fadeOut();
        }
        
        if (event.data.display == true ){
            if (event.data.speed >= 60 && event.data.speed <= 129) {
                $('.boxes-srt').css('border', '4px #378959 solid');
            } else if (event.data.speed >= 130 && event.data.speed <= 179) {
                $('.boxes-srt').css('border', '4px solid #e9e895');
            } else if (event.data.speed >= 180) {
                $('.boxes-srt').css('border', '4px solid #c84528');
            }
            else {
                $('.boxes-srt').css('border', '4px #ffffff solid');
            };
        };

        if (event.data.display == true ){
            if (event.data.gasoline >= 0 && event.data.gasoline <= 29) {
                $('.boxes-gas').css('border', '4px #c84528 solid');
                $('.boxes-gas').css('animation-name', 'blinking');
                $('.boxes-gas').css('animation-duration', '1s');
                $('.boxes-gas').css('animation-iteration-count', '100');
            } else if (event.data.gasoline >= 30 && event.data.gasoline <= 74) {
                $('.boxes-gas').css('border', '4px solid #e9e895');
                $('.boxes-gas').css('animation-name', 'none');
            } else if (event.data.gasoline >= 75) {
                $('.boxes-gas').css('border', '4px solid #ffffff');
                $('.boxes-gas').css('animation-name', 'none');
            }
            else {
                $('.boxes-gas').css('border', '4px #ffffff solid');
                $('.boxes-gas').css('animation-name', 'none');
            };
        };

        if (event.data.display == true ){
            if (event.data.body >= 0 && event.data.body <= 29) {
                $('.boxes-spdgas').css('border', '4px #ffff00 solid'); 
                $('.boxes-spdgas').css('animation-name', 'fastblinking');
                $('.boxes-spdgas').css('animation-duration', '0.5s');
                $('.boxes-spdgas').css('animation-iteration-count', '100');
            } else if (event.data.body >= 30 && event.data.body <= 74) {
                $('.boxes-spdgas').css('border', '4px solid #e9e895');
                $('.boxes-spdgas').css('animation-name', 'none');
                $('.boxes-spdgas').css('animation-name', 'blinking');
                $('.boxes-spdgas').css('animation-duration', '1.5s');
                $('.boxes-spdgas').css('animation-iteration-count', '100');
            } else if (event.data.body >= 75) {
                $('.boxes-spdgas').css('border', '4px solid #ffffff');
                $('.boxes-spdgas').css('animation-name', 'none');
            }
            else {
                $('.boxes-spdgas').css('border', '4px #ffffff solid');
                $('.boxes-spdgas').css('animation-name', 'none');
            };
        };

    });
});