$(function(){
  $('#showImg').change(
    function () {
        if (!this.files.length) {
            return;
        }
        var file = $(this).prop('files')[0];
        var fr = new FileReader();
        $('.cover-image-upload').css('background-image', 'none');
          fr.onload = function() {
            $('.cover-image-upload').css('background-image', 'url(' + fr.result + ')');
            $('.cover-image-upload').css('background-size', '100%')
          $('.cover-image-upload').css('width', 700)

          }
          fr.readAsDataURL(file);
          $(".cover-image-upload img").css('opacity', 0);
    }
  );
})
