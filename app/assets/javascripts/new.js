$(function(){
  $('#prototype_captured_images_attributes_0_content').on("change", function(){
    // $('#img-responsive').prop('disabled', false);
    // $('#img-responsive').remove();
    var file = $(this).prop('files')[0];
    if(!file.type.match('image.*')){
      return
    }
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      $('.cover-image-upload').html('<img src="' + fileReader.result + '"/, width="701" height="500">').css('background-image', 'none');
    }
    fileReader.readAsDataURL(file);
  });
});
