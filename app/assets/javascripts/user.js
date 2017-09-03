$(function() {

  var user_list = $("#user-search-result");
  var chat_list = $("#chat-group-users");

  function search_list(user) {
     var html = `<div class="chat-group-user clearfix">
                 <p class="chat-group-user__name">${user.name}</p>
                 <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id= "${user.id}" data-user-name= "${user.name}">追加</a>
                 </div>`
      user_list.append(html);
      }

  function noUser(user) {
      var html = `<div class="chat-group-user clearfix">
                    <p class="chat-group-user__name">${user}</p>
                  </div>`;
      user_list.append(html);
    }

  function addUser(name,id) {
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
              <input name= 'group[user_ids][]' type='hidden' value= ${id}>
              <p class='chat-group-user__name'>${name}</p>
              <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
              </div>`
    chat_list.append(html);
  }

  $(".chat-group-form__input").on("keyup", function() {
    var input = $(this).val();

    $.ajax({
          type: 'GET',
          url: '/users',
          data: { keyword: input },
          dataType: 'json'
    })

  .done(function(users) {
    $("#user-search-result").empty();
     if (users.length !== 0) {
       users.forEach(function(user){
         search_list(user);
       });
     }
     else {
         noUser("一致する名前はありません");
     }
   })
  .fail(function() {
    alert('作成に失敗しました');
    })
  });

  $(document).on('click', '.chat-group-user__btn--add', function(){
    var name = $(this).data('user-name');
    var id = $(this).data('user-id');
    addUser(name,id)
   $(this).parent('.chat-group-user').remove();
  });

  $(document).on('click', '.chat-group-user__btn--remove', function(){
    $(this).parent('.chat-group-user').remove();
  });
});


