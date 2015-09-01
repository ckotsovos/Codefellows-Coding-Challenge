// MAGIC ToDo LIST
$(function() {
  $input = $('input');
  $ul = $('ul');

  $input.select();

  $input.on('keyup', function(x) {
    if (x.keyCode === 13) {
      x.cancelBubble = true;
      if (x.stopPropagation) x.stopPropagation();
      if ($input.val() !== '') {
        $ul.prepend('<li>' + $input.val() + '</li>');
      }
      $input.val('').select();
    }
  });

  $ul.on('click', 'li', function() {
    $(this).remove();
    $input.select();
  });
});
