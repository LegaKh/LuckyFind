jQuery(function($) {

    $(".deletePet").click( function() {
        var current_ad = $(this).parents('.ad')[0];
        if(confirm("Are you sure to delete?")) {
            $.ajax({
                url: '/pets/' + $(current_ad).attr('data-ad_id'),
                type: 'POST',
                data: { _method: 'DELETE'},
                success: function() {
                    $(current_ad).fadeOut(200);
                }
            });
        };
    });

});