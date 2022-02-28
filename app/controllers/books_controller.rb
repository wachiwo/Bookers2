class BooksController < ApplicationController
 before_action :correct_user, only: [:edit, :update]

    def new
      @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
    if @book.save
      flash[:create] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
    end

    def index
      @book = Book.new
      @user = current_user
      @books = Book.all
    end

    def show
      @user = current_user
      @book = Book.find(params[:id])
      @newbook = Book.new

    end

    def edit
      @users = User.all
      @book = Book.find(params[:id])
      @user = current_user
      @books = Book.all
    end

    def update
      @book = Book.find(params[:id])
      @book.update(book_params)
      
      if @book.save
     flash[:create] = 'You have updated book successfully.'
      redirect_to book_path(@book.id)
      else
      @user = current_user
      #@books = Book.all
      render :edit
      
      end
    end

    def destroy
      book = Book.find(params[:id])  # データ（レコード）を1件取得
      book.destroy  # データ（レコード）を削除
      redirect_to '/books'  # 投稿一覧画面へリダイレクト
    end

    private  #ストロングパラメータ
      def book_params
        params.require(:book).permit(:title, :body)
      end
      
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
