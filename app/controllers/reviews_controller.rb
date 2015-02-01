class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }

      else
        format.html { render :new }

      end
    end
  end

  def update

      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }

      else
        format.html { render :edit }


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
end
