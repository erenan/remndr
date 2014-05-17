class CategoriesController < ApplicationController

#This method retrieves the all of the current user's categories to create the list to show called as GET
#Method is reaced through a custom path, see Routes file
  def show_all

    @user=current_user
    @categories=Category.user_categories(current_user.id)

  end

#Shows the selected category
  def show

    @category=Category.find(params[:id])

  end

#Edits the selected category
  def edit

    @category=Category.find(params[:id])

  end

#Gets the params from the edit form (via strong params below) and updates entry
  def update

      @category = Category.find(params[:id])
      @category.update_attributes(category_params.merge(user_id: current_user.id))

#if there is an error it re-renders the "new" view which will show the errors
      if @category.save
         redirect_to :root
      else
       render :new
      end

  end

#destroys the selected category
  def destroy
		@category=Category.find(params[:id])

#If the user somehow manages to call a Destroy on a category she doesn't own this prevents that from succeding. Altough this should not happen
		if @category.user.id == current_user.id
			@category.destroy
			redirect_to :back
		else
			flash[:notice] = "That is not your Category! Cannot delete"
			redirect_to :back
		end

	end

#Creates a new entry
  def new
   	 	@category = Category.new
  end

#Saves the newly created category
  def create
   		 @category = Category.new(category_params.merge(user_id: current_user.id))

#if there is an error it re-renders the "new" view which will show the errors
    	if @category.save
       	 redirect_to :root
    	else
     	 render :new
    	end
  end

 	private

#strong params used when creating or updating a category	
  def category_params
  	  params.require(:category).permit(:name, :user_id)
  end


end
