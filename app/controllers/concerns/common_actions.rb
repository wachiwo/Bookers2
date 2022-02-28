module CommonActions
 #以下extendは必須
  extend ActiveSupport::Concern

  def user_inf
    @book = Book.new
    @user = current_user
    @books = Book.all

  end

end