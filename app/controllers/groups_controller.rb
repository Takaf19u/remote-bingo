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
    group = get_group()
    group.update(rands: params[:rands])
  end

  def rands
    group = get_group()
    respond_to do |format|
      format.json {render json: {group: group }}
    end
  end

  private 
  def group_params
      params.require(:groups).permit(:groupName, :password, :password_confirmation ).merge(user_id: current_user.id)
  end

  def get_group
    card = Card.find_by(id: params[:id])
    return  card.group
  end

end
