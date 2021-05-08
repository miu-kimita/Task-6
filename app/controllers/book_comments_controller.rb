class BookCommentsController < ApplicationController

  before_action :book_params

  def create
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def book_params
    @book = Book.find(params[:book_id])
  end
end
