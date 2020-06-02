class GroupsController < ApplicationController

  def index

  end

  def create
    master = User.new(user_params)
    master.save
    binding.pry
    group = Group.new(group_params)
    group.save
    render 'create', formats: 'json', handlers: 'jbuilder'
  end

  private 
  def user_params
    # 子要素のstrong parameterを書くことで、自動で子要素に親要素のidもふられる。explanatinテーブルにあるrecreation_idに親要素のidがふられます。
    params.require(:users).permit(:masterName)
  end

  def rec_params
      # 子要素のstrong parameterを書くことで、自動で子要素に親要素のidもふられる。explanatinテーブルにあるrecreation_idに親要素のidがふられます。
      params.require(:groups).permit(:groupName, :password ).merge(user_id: master.id)
  end

end
