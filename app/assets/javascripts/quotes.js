var id_quote = 0;

$(function(){
    $('#confirmPay').on('show.bs.modal', function (event) {
        var link = $(event.relatedTarget);
        id_quote = link.data('quote');
        var number_quote = link.data('number');

        $("#message_modal_confirmPay").text("Are you sure want to pay the quote number " + number_quote + "?");

    });
    $('#pay_button').on('click', function () {
        var $btn = $(this).button('loading');

        $.post( "/sales/quotes/pay/" + id_quote, function() {

        })
            .done(function() {
                $('#confirmPay').modal('hide');
                $('#quote_' + id_quote + '_pay').parent().html("Paid");
                $btn.button('reset');
            })
            .fail(function() {
                alert( "error" );
                $btn.button('reset');
            });

    })
});
