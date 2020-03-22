$(function(){
  function appendChildCategory(child){
    var html =`<li class="left__item--left__children__list">
    <a class="child_category" id="${child.id}" href="#">${child.name}</a>
    </li>`;
    $(".left__item--left__children").append(html)
  }
  $(document).on("mouseover",".parent_category",function(){
    var id = this.id
    $(".left__item--left__children__list").remove();
    $(".left__item--left__grand__children__list").remove();
    $.ajax({
      type: 'GET',
      url: '/home/new',
      data: {parent_id: id},
      dataType: 'json'
    })
    .done(function(children) {
      children.forEach(function (child) {
        appendChildCategory(child);
      })
    });
  });
  function buildGrandChildHTML(child){
    var html =`<li class="left__item--left__grand__children__list">
    <a class="grand_child_category" id="${child.id}" href="#">${child.name}</a>
    </li>`;
    return html;
  }
  $(document).on("mouseover",".child_category",function(){
    var id = this.id
    $(".left__item--left__grand__children").empty(); 
    $.ajax({
      type: 'GET',
      url: '/home/new',
      data: {parent_id: id},
      dataType: 'json'
    })
    .done(function(children) {
      children.forEach(function (child) {
        var html = buildGrandChildHTML(child);
        $(".left__item--left__grand__children").append(html);
      });
    });
  });
});