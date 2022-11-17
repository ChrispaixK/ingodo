class TransfersController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @transfers = @category.transfers.order(created_at: :desc)
  end

  def new
    @transfer = Transfer.new
    @categories = current_user.categories
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @transfer = Transfer.new(transfer_params)
    @transfer.user = current_user

    @transfer.save
    respond_to do |format|
      format.html do
        if @transfer.save
          flash[:notice] = 'Transfer created successfully'

        else
          flash[:alert] = 'Transfer not created Try Again!'

        end
      end
    end
    redirect_to category_transfers_path(@category)
  end

  private

  def transfer_params
    params.require(:transfer).permit(:name, :amount, category_ids: [])
  end
end
