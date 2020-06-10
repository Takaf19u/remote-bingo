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
      binding.pry
      format.json {render json: url }
    end
  end

  private 
  def group_params
      # 子要素のstrong parameterを書くことで、自動で子要素に親要素のidもふられる。explanatinテーブルにあるrecreation_idに親要素のidがふられます。
      params.require(:groups).permit(:groupName, :password, :password_confirmation ).merge(user_id: current_user.id)
  end

end
