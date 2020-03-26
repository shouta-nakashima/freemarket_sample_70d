$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='form__item-category--contents select' id= 'children_wrapper'>
                          <select class="listing-select-wrapper__box--select" id="child_category" name="item[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                       </div>`;
    $('.form__item-category--content').append(childSelectHtml);
  }
  $('#item_category_id').on('change', function(){
    var parentCategory = $('#item_category_id').val()
    console.log(parentCategory)
    if (parentCategory != ""){ 
      $.ajax({
        url: '/items/get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); 
        $('#child_category').remove(); 
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#child_category').remove(); 
      $('#grandchildren_wrapper').remove();
    }
  });
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='form__item-category--content select' id= 'grandchildren_wrapper'>
                                <select class="listing-select-wrapper__box--select" id="grandchild_category" name="item[category_id]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                            </div>`;
    $('.form__item-category--content').append(grandchildSelectHtml);
  }
  $('.form__item-category--content').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); 
    if (childId != ""){ 
      $.ajax({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); 
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
  });
})
