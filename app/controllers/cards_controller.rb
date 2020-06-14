class CardsController < ApplicationController

  def show
    card = Card.find_by( group_id: params[:id], user_id: current_user.id )

    respond_to do |format|
      format.json {render json: {card: card} }
    end
  end 

  def update
    card = Card.find_by(id: params[:id])
    card.update(rand_number: params[:rand_number])
  end

  def create
    card = Card.new(card_params)
    if card.save
      flash[:notice] = "グループを作成しました。"
      url = "/createGroup/#{card.group_id}"
    else
      flash.now[:alert] = 'グループの作成に失敗しました。'
      url = "/createGroup"
    end
    
    respond_to do |format|
      format.json {render json: url }
    end
  end

  private 
  def card_params
      params.require(:cards).permit(:rand_number, :create_count, :group_id ).merge(user_id: current_user.id)
  end
end
