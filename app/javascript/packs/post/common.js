$(function() {
    $( 'input[name="post[answer_type]"]:radio' ).change( function() {
        if($(this).val() == "choice"){
            $('.answer_positions_fields').hide();
            $('.answer_choices_fields').show();
        }else{
            $('.answer_positions_fields').show();
            $('.answer_choices_fields').hide();
        }
    });
});
