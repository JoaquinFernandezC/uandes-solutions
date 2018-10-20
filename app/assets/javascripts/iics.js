$(document).on("turbolinks:load", function() {
    var selectizeCallback = null;

    $(".employee-modal").on("hide.bs.modal", function (e) {
       if (selectizeCallback != null) {
           selectizeCallback();
           selectizeCallback = null;
       }
        $("#new_employee").trigger("reset");
        Rails.enableElement($('#new_employee')[0]);
    });

    $(".new_employee").on("submit", function (e) {
        e.preventDefault();
        $.ajax({
            method: "POST",
            url: $(this).attr("action"),
            data: $(this).serialize(),
            success: function (response) {
                selectizeCallback({value: response.object.id, text: response.text});
                selectizeCallback = null;
                $(".employee-modal").modal('toggle');
            }
        });
    });

    $(".selectize").selectize({
        create: function(input, callback) {
            selectizeCallback = callback;
            $(".employee-modal").modal();
        }
    });

    $(".selectizeType").selectize({

    });
});