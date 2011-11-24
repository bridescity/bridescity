(function(undefined) {

var utils = (function() {
  var confirm = function(msg) {
    return window.confirm(msg);
  };

  var message = function(msg) {
    alert(msg);
  };

  return {
    confirm: confirm,
    message: message
  };
})();

/*==============COMMENTS MODULE===============*/
var comments = (function() {
  //private
  var $comments, $replyForm, $commentForm, $replyingComment

    showForm = function($comment) {
      var $commentBody = $comment.children(".comment_body");

      if(typeof $replyingComment !== "undefined") {
        hideForm();
      }

      $replyingComment = $comment;
      $replyForm
        .find(".id").val($commentBody.data('id'))
        .find(".content").val("");

      $commentBody.find(".comment_reply").hide();
      $comment.children(".nested_comments").prepend($replyForm);
    },

    hideForm = function() {
      $replyingComment.find(".comment_reply").show();
      $replyForm.detach();
      $replyingComment = undefined;
    },

    addComment = function(data, isReply) {
      var $newComment = $("<div class='comment'></div>")
        .append(data)
        .append($("<div class='nested_comments'></div>"));

      if(isReply) {
        $replyForm.detach();
        $replyingComment.children(".nested_comments").append($newComment);
        hideForm();
      } else {
        $comments.find(".comments_list").append($newComment);
        $commentForm.find(".content").val("");
      }
    };

  //public
  var self = {
    init: function() {
      $comments = $(".comments");
      $replyForm = $comments.find(".reply_form").show().detach();
      $commentForm = $comments.find(".add_comment");

      $comments.delegate(".comment_reply", "click", function() {
        showForm($(this).closest(".comment"));
      });

      $replyForm.find(".cancel").click(function() {
        hideForm();
      });

      $replyForm.find("form").bind("ajax:success", function(xhr, data) {
        addComment(data, true);
      });

      $commentForm.find("form").bind("ajax:success", function(xhr, data) {
        addComment(data, false);
      });
    }
  };

  return self;
})();

var friendships = (function() {
  var init = function() {
    $(".friendship_request").click(function() {
      var $link = $(this);

      if(utils.confirm("Добавить в друщья?")) {
        var $friendshipForm =  $link.closest(".friendship_form");

        $friendshipForm
          .one("ajax:success", function(xhr, data) {
            utils.message("Запрос отправлен!");
            $link.remove();
          })
          .submit();
      }
    });
  };

  return {
    init: init
  };
})();

$(function() {
  comments.init();
  friendships.init();
});

})();