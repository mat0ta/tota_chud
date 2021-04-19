$(document).ready(function(){
    window.addEventListener("message", function(event){
        if(event.data.display == true){
            $('.linea').css("width", (event.data.speed) * 2.5);
            $('.principal').fadeIn();
            $('.speed').text(event.data.speed);
            $('.kilometraje').text(event.data.kilometraje);
            $('.street').text(event.data.street);
        } else {
            $('.principal').fadeOut();
        };

        if (event.data.display == true) {
            if (event.data.gas <= 10) {
                $('.gas').text("0" + event.data.gas);
            } else {
                $('.gas').text(event.data.gas);
            }
        };

        if (event.data.display == true ){
            if (event.data.engine >= 0 && event.data.engine <= 29) {
                $('.engine').css('border', '4px #FBFF00 solid'); 
                $('.engine').css('animation-name', 'fastblinking');
                $('.engine').css('animation-duration', '0.5s');
                $('.engine').css('animation-iteration-count', '100');
            } else if (event.data.engine >= 30 && event.data.engine <= 74) {
                $('.engine').css('border', '4px solid #e9e895');
                $('.engine').css('animation-name', 'none');
                $('.engine').css('animation-name', 'blinking');
                $('.engine').css('animation-duration', '1.5s');
                $('.engine').css('animation-iteration-count', '100');
            } else if (event.data.engine >= 75) {
                $('.engine').css('border', '4px solid rgb(103, 235, 98)');
                $('.engine').css('animation-name', 'none');
            }
            else {
                $('.engine').css('border', '4px rgb(103, 235, 98) solid');
                $('.engine').css('animation-name', 'none');
            };
        };

    });
});