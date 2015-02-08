class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]


  # GET /books
  # GET /books.json
  def index
    @books = Book.all.order("created_at DESC")
  end

  def show
  end

  def new
    @book = current_user.books.build
  end

  def edit
  end

  def create
    @book = current_user.books.build(book_params)
      if @book.save
       redirect_to @book, notice: 'Book was successfully created.' 

      else
       render :new 

      end
  end
  

  def update

      if @book.update(book_params)
        redirect_to @book, notice: 'Book was successfully updated.' 

      else
        render :edit 


    end
  end

  def destroy
    @book.destroy
    redirect_to books_url
  end

  private
  #Use callbacks to share common setup or constrains between actions.

  def set_book
    @book = Book.find(params[:id])
  end

  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    redirect_to books_path, notice: "Not authorized to edit this book." if @book.nil?
  end

  def book_params
    params.require(:book).permit(:description, :image)
  end
  
end


  def destroy
    @book.destroy

      redirect_to books_url, notice: 'Book was successfully destroyed.' 

    end
  

  private

    def set_book
      @book = book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:description, :string)
    end

