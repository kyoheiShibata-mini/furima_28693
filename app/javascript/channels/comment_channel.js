import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    const html = `<div class="comment">
    <p class="comment-user">
    ${data.name}さんのコメント: ${data.content.created_at}
    </p>
    <p class="comment-content">${data.content.text}</p>
    </div>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
});
