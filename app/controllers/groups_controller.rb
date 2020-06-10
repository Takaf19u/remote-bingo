class GroupsController < ApplicationController

  def index

  end

  def create
    group = Group.new(group_params)
    if group.save
      flash[:notice] = "グループを作成しました。"
      url = "/createGroup/#{group.id}"
    else
      flash.now[:alert] = 'グループの作成に失敗しました。'
      url = "/createGroup"
    end
    
    respond_to do |format|
      format.json {render json: url }
    end
  end

  def update
    group = Group.find_by(id: params[:id])
    group.update(rands: params[:rands])
  end

  def rands
    group = Group.find_by(id: params[:id])

    respond_to do |format|
      format.json {render json: group.rands }
    end
  end

  private 
  def group_params
      params.require(:groups).permit(:groupName, :password, :password_confirmation ).merge(user_id: current_user.id)
  end

end
