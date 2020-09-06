class BooksController < ApplicationController

  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])  #編集したい本の情報
   
  end

  def update
    
    @book = Book.find(params[:id])
  if @book.update(books_params)
      flash[:notice] = "successfully"
    redirect_to book_path(@book)
  else
    @books = Book.all
    render 'edit'
    
  end
  end

  def create
    @book = Book.new(books_params)
    if @book.save
     flash[:notice] ="successfully"
     redirect_to book_path(@book.id)
    else
    
    @books = Book.all
     render 'index'
    end
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   flash[:notice] = "successfully"
   redirect_to books_path
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end


end
