class ItsTransactionsController < ApplicationController
    def index
      @category = current_user.categories.includes(its_transactions: :author).find(params[:category_id])
      @its_transactions = @category.its_transactions.order(created_at: :desc)
      @total_amount = @category.its_transactions.sum(:amount)
    end

    def new
      @category = current_user.categories.find(params[:category_id])
      @transaction = current_user.its_transactions.build
    end
  
    def create
      @transaction = current_user.its_transactions.new(amount: transaction_params[:amount], name: transaction_params[:name])
      category_ids = transaction_params[:category_ids]&.compact&.drop(1) || [] 
      category_ids.each do |category_id|
        if category_id 
          @category = current_user.categories.find(category_id)
          @category.its_transactions << @transaction
        end
      end
      set_category()
  
      if @transaction.save
        redirect_to category_its_transactions_path(@category), notice: "Transaction created successfully."
      else
        render :new
      end
    end
  
    private
  
    def set_category
      @category = current_user.categories.find(params[:category_id])
    end
  
    def transaction_params
      # params.require(:its_transaction).permit(:name, :amount, :category_id)
      params.require(:its_transaction).permit(:name, :amount, category_ids: [])

    end
end
