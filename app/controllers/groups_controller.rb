class GroupsController < ApplicationController

  def index

  end

  def create
    binding.pry
    group = Group.new(group_params)
    if group.save
      flash[:notice] = "グループを作成しました。"
      render json: true
    else
      flash.now[:alert] = 'グループの作成に失敗しました。'
      render json: false
    end
  end

  private 
  def group_params
      # 子要素のstrong parameterを書くことで、自動で子要素に親要素のidもふられる。explanatinテーブルにあるrecreation_idに親要素のidがふられます。
      params.require(:groups).permit(:groupName, :password ).merge(user_id: current_user.id)
  end

end
