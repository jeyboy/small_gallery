function setLike(path, picture_id)
{
   jQuery.ajax({
     type : 'POST',
     url : path,
     data : {'like' : { 'picture_id' : picture_id} },
     success: function(response) {
        if (response.status)
        {
            jQuery('span.set_like').hide();
            var $temp = parseInt(jQuery('span.likes_count').text());
            jQuery('span.likes_count').text(""+($temp+1))
        }
     }
   });
   return false;
}
