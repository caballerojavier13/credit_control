$(document).ready(function(){
    $('.datepicker').datepicker({
        format: "dd/mm/yyyy"
    });
    $('#filter_payment').on("change",function(){
        window.location.href = window.location.href.split("?")[0] + "?filter_payment=" + $(this).val() + '&filter_person=' + $('#filter_person').val();
    });
    $('#filter_person').on("change",function(){
        window.location.href = window.location.href.split("?")[0] + "?filter_payment=" + $('#filter_payment').val() + '&filter_person=' + $(this).val();
    });
    getFilterList();

});

function getFilterList(){

    var mainurl = document.location.href.split("?");

    if(mainurl.length > 1) {

        mainurl = mainurl[1].split("&");

        $('#filter_payment').val(mainurl[0].split("=")[1]);
        $('#filter_person').val(mainurl[1].split("=")[1]);

    }
}