class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = User.all
    @total_by_city = User.group(:city).count
  end

  # GET /users/:id
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "Usuario creado exitosamente."
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  # GET /users/:id/edit
  def edit; end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "Usuario actualizado exitosamente."
    else
      render :edit
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "Usuario eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  # GET /users/export
  def export
    @users = User.all
    pdf = UsersPdf.new(@users)

    respond_to do |format|
      format.pdf do
        send_data pdf.render, filename: "usuarios.pdf", type: "application/pdf", disposition: "attachment"
      end
    end
  end

  # GET /users/list_json
  def list_json
    users = User.all
    render json: users
  end

  private

  # Set user for the specified actions
  def set_user
    @user = User.find(params[:id])
  end

  # Strong parameters
  def user_params
    params.require(:user).permit(:name, :date_of_birth, :city, :email, :address, :country, :apartment)
  end
end
