class RolesController < ApplicationController
  before_action :set_user
  before_action :set_role, only: [:show, :create, :destroy]

  def show
    render @roles
  end

  def create
    @user.roles.create(role_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy
    role = roles.find_by(role_params)
    @roles.destroy(role)

    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_role
    @roles = @user.roles
  end

  def role_params
    params.require(:role).permit(:name)
  end
end
