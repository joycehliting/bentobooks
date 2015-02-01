class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only [:edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = current_user.reviews.build
  end

  def edit
  end

  def create
    @review = current_user.reviews.build(review_params)
      if @review.save
       redirect_to @review, notice: 'Review was successfully created.' 

      else
       render :new 

      end
  end
  

  def update

      if @review.update(review_params)
        redirect_to @review, notice: 'Review was successfully updated.' 

      else
        render :edit 


    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_url
  end

  private
  #Use callbacks to share common setup or constrains between actions.

  def set_review
    @review = Review.find(param[:id])
  end

  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    redirect_to pins_path, notice: "Not authorized to edit this review." if @review.nil?
  end

  def pin_params
    params.require(:pin).permit(:description, :image)
  end
  
end


  def destroy
    @review.destroy

      redirect_to reviews_url, notice: 'Review was successfully destroyed.' 

    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:description, :string)
    end

