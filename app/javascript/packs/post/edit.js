window.onload = function() {
    $('.answer_positions_fields').hide();
    $('.answer_choices_fields').hide();
    let post_answer_type = $('.post_answer_type').val();
    if(post_answer_type == "choice"){
        $('.answer_positions_fields').hide();
        $('.answer_choices_fields').show();
    }else{
        $('.answer_positions_fields').show();
        $('.answer_choices_fields').hide();
    }
}
