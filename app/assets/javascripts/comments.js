function sendComment(path, picture_id, user_email, text)
{
   jQuery.ajax({
     type : 'POST',
     url : path,
     data : {'comment' : {'body' : text, 'user_email' : user_email, 'picture_id' : picture_id} },
     success: function(response) {
        if (response.status)
        {
            jQuery('#comment_body').attr('value', '');
            var block = "<div class='comment'>" +
                            "<div class='name'>" + user_email + "</div>" +
                            "<div class='comment_time'>" + response.create_time + "</div>" +
                            "<div class='clear'></div>" +
                            "<div class='comment_body'>" + text + "</div>" +
                        "</div><br/>";
            jQuery('#comments').append(block);
        }
     }
   });
   return false;
}
