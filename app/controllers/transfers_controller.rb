class TransfersController < ApplicationController
    def index
      @category = Category.find_by(id: params[:id])
    end

    def ancient
      @category = Category.find_by(id: params[:id])
    end

    def new
      @transfer_id = params[:id]
    end

    def create
        @transfer = Transfer.create(name: params[:name], amount: params[:amount],user_id: current_user.id)
        
        JoinCategoriesWithTransfer.create(category_id: params[:transfer_id], transfer_id: @transfer.id)
        redirect_to "/categories/#{params[:transfer_id]}/transfers"
    end
end
