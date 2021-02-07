

$(function(){

    window.addEventListener("message", function(event){

        if ( event.data.coche == false ) {
            var selector = document.querySelector("html")
            selector.style = "display:none;"
            
        }
        if ( event.data.coche == true ) {
            var selector = document.querySelector("html")
            selector.style = "display:block;"
            
        }

        $("#velocidad").html(Math.round(event.data.vel) + "");
        $("#cont").html(Math.round(event.data.cuent) + "");
        $("#fuel").css("width", (event.data.gasolina) * 2 + "");
        $("#rpm").html(Math.round(event.data.rpm) + "");
        $("#vida").css("opacity", (event.data.vida) / 10 + "%");
    })
        
})

document.addEventListener("DOMContentLoaded", () => {
    $("html").hide();
});
