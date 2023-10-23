class CommentsController < ApplicationController
  def create
    # binding.pry
    @comment = Comment.create!(comments_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_url(@comment.post), notice: "O post foi criado com sucesso." }
      end
    
    #redirect_to comment.post, notice: 'O seu comentário foi enviado.'
  end

  private
  
  def comments_params
    params.require(:comment).permit(:post_id, :author, :body)
  end

end
