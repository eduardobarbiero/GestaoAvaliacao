var ready = function () {
  func = {
      changeStatus: function (value) {
          if ($('#email_con').val() != '') {
            if (value.toString().indexOf(',') > -1) {
                if (value.toString() != $('#email_con').val())
                  $('#email_con').val(value);
            } else {
                  if (!$.inArray(value.toString(), $('#email_con').val().split(',')) > -1) {
                      $('#email_con').val($('#email_con').val() + ',' + value);
                  }
              }
          }
          else
          $('#email_con').val(value);
      },
      changeStatusDelete: function (value){
          var res = $('#email_con').val().split(',');
          res.splice($.inArray(value, res), 1);
          $('#email_con').val(res.toString());
      }
  }

}

$(document).ready(ready);
$(document).on("page:load", ready);