$(document).ready(function(){
$('#miniIm1').click(function() {
    var thmb = this;
    var src = this.src;
    $('#mainImg').fadeOut(400,function(){
        thmb.src = this.src;
        $(this).fadeIn(400)[0].src = src;
    });
});
$('#miniIm2').click(function() {
    var thmb = this;
    var src = this.src;
    $('#mainImg').fadeOut(400,function(){
        thmb.src = this.src;
        $(this).fadeIn(400)[0].src = src;
    });
});
$('#miniIm3').click(function() {
    var thmb = this;
    var src = this.src;
    $('#mainImg').fadeOut(400,function(){
        thmb.src = this.src;
        $(this).fadeIn(400)[0].src = src;
    });
});
});