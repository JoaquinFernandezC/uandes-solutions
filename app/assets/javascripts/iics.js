$(document).on("turbolinks:load", function() {
    $('#manager_multiselect').multiselect({
        enableFiltering: true,
        buttonWidth: '100%',
        maxHeight: 400,
        buttonText: function(options, select) {
            if (options.length === 0) {
                return 'Seleccionar ...';
            }
            else if (options.length > 2) {
                return options.length.toString() + ' seleccionados';
            }
            else {
                var labels = [];
                options.each(function () {
                    if ($(this).attr('label') !== undefined) {
                        labels.push($(this).attr('label'));
                    }
                    else {
                        labels.push($(this).html());
                    }
                });
                return labels.join(', ') + '';
            }
        }
    });
    $('#internal_member_multiselect').multiselect({
        enableFiltering: true,
        buttonWidth: '100%',
        maxHeight: 400,
        buttonText: function(options, select) {
            if (options.length === 0) {
                return 'Seleccionar ...';
            }
            else if (options.length > 2) {
                return options.length.toString() + ' seleccionados';
            }
            else {
                var labels = [];
                options.each(function () {
                    if ($(this).attr('label') !== undefined) {
                        labels.push($(this).attr('label'));
                    }
                    else {
                        labels.push($(this).html());
                    }
                });
                return labels.join(', ') + '';
            }
        }
    });
    $('#external_member_multiselect').multiselect({
        enableFiltering: true,
        buttonWidth: '100%',
        maxHeight: 200,
        buttonText: function(options, select) {
            if (options.length === 0) {
                return 'Seleccionar ...';
            }
            else if (options.length > 2) {
                return options.length.toString() + ' seleccionados';
            }
            else {
                var labels = [];
                options.each(function () {
                    if ($(this).attr('label') !== undefined) {
                        labels.push($(this).attr('label'));
                    }
                    else {
                        labels.push($(this).html());
                    }
                });
                return labels.join(', ') + '';
            }
        }
    });

    $('form').on('click', '.add_fields', function(event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $(this).before($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });
});

$(document).ready(function() {

});