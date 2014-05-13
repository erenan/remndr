class CategoriesController < ApplicationController

  def show_all

    @user=current_user
    @categories=Category.user_categories(current_user.id)

  end


  def show

    @category=Category.find(params[:id])

  end

  def edit

    @category=Category.find(params[:id])

  end

  def update

      @category = Category.find(params[:id])
      @category.update_attributes(category_params.merge(user_id: current_user.id))

      if @category.save
         redirect_to :root
      else
       render :new
      end

  end

  def destroy
		@category=Category.find(params[:id])

		if @category.user.id == current_user.id
			@category.destroy
			redirect_to :back
		else
			flash[:notice] = "That is not your Category! Cannot delete"
			redirect_to :back
		end

	end

  def new
   	 	@category = Category.new
  end

  def create
   		 @category = Category.new(category_params.merge(user_id: current_user.id))

    	if @category.save
       	 redirect_to :root
    	else
     	 render :new
    	end
  end

 	private
  	
  def category_params
  	  params.require(:category).permit(:name, :user_id)
  end


end
