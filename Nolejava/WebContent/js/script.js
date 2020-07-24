pageSize = 4;

showPage = function(page) {
    $(".col-md-3").hide();
    $(".col-md-3").each(function(n) {
        if (n >= pageSize * (page - 1) && n < pageSize * page)
            $(this).show();
    });
}

showPage(1);

$("#pagin li a").click(function() {
    $("#pagin li a").removeClass("current");
    $(this).addClass("current");
    showPage(parseInt($(this).text()))
});



$('.toggle-password').on('click', function() {
    let input = $("#input-pwd");
    if (input.attr('type') == 'password') {
        $(".fa.fa-fw.fa-eye").toggleClass('fa-eye fa-eye-slash');
        input.attr('type', 'text');
    } else {
        $(".fa-eye-slash").toggleClass('fa-eye fa-eye-slash');
        input.attr('type', 'password');
    }
});

$("input.datascadenza").datepicker({
    minDate: 0 
});