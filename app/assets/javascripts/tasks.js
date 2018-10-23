$(document).on("turbolinks:load", function() {
    $('#privacy_multiselect').multiselect({
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
  $('#task_name_multiselect').multiselect({
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

    $('#status_multiselect').multiselect({
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
});

$(document).ready(function() {

});