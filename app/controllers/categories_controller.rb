class CategoriesController < ApplicationController
 before_action :set_category, except:[:new, :index ,:create]
  def new
   @category = Category.new
  end
  def index
    @categories = Category.all
  end

  def create
   @category= Category.new(category_params)
 
   if @category.save
   redirect_to @category
   else
   render :new
  end
 end

  def show
    #@category = Category.find(params[:id])
  end

  def edit

    
  end

  def update
    if @category.update category_params
      redirect_to categories_path
    else
     render :edit
    end   
 end         

  def destroy
   @category.destroy
   respond_to do |format|
     format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.'}
     format.json { head :no_content }
  end
end

  private
   def  set_category
    @category = Category.friendly.find(params[:id])
   end
   def category_params
    params.require(:category).permit(:name,:brand)
   end
  
end