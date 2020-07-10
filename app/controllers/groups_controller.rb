class GroupsController < ApplicationController

  def index

  end

  def create
    group = Group.new(group_params)
    if group.save
      flash[:notice] = "グループを作成しました。"
      id = group.id
    else
      flash.now[:alert] = 'グループの作成に失敗しました。'
      id = 0
    end
    
    respond_to do |format|
      format.json {render json: {id: id }}
    end
  end

  def update
    card = get_card()
    card.group.update(rands: params[:rands])
  end

  def rands
    card = get_card()
    respond_to do |format|
      format.json {render json: {group: card.group, card: card  }}
    end
  end

  private 
  def group_params
      params.require(:groups).permit(:groupName, :password, :password_confirmation ).merge(user_id: current_user.id)
  end

  # カード情報取得
  def get_card
    card = Card.find_by(id: params[:id])
    return  card
  end

end
