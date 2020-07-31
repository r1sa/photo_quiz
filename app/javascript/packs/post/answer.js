import "../jquery.maphilight.js"
window.onload = function() {
    $('img[usemap]').maphilight({
        alwaysOn: true //常に表示するようデフォルト値を上書きする
    });
    $('.answer_position').css({
        width: '600px',
        margin: '0 auto',
        'border-radius': '10px',
        'object-fit': 'cover'
    });
}
