class UsersController < ApplicationController
  before_action :not_signed_in_user, only: [:new, :create, 
                                            :forgot_password, :reset_password]
  before_action :signed_in_user, only: [:show, :edit, :update,
                                        :edit_password, :update_password,
                                        :edit_email, :update_email]
  before_action :admin_user, only: [:index, :destroy]

  # Show All Users
  # Requires admin permission
  def index
    @users = User.all
  end

  # Show User Information
  # User Profile
  def show
    @user = current_user
  end

  # Sign Up
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Success

      # Auto Login
      sign_in @user

      # Send Activation Email
      send_activation_email(@user)

      # Flash Message
      flash[:success] = "회원가입이 정상적으로 완료되었습니다."
      redirect_to profile_path
    else
      # Failed
      flash[:error] = "회원가입에 실패했습니다. 계속되는 경우 관리자에게 문의하세요."
      render 'new'
    end
  end

  def resend_activation_email
    @user = current_user

    send_activation_email(@user)
    flash[:success] = "인증 이메일이 재발송되었습니다."
    redirect_to profile_path
  end

  def activate_user
    activation_token = params[:activation_token]
    @user = User.find_by(activation_token: activation_token)

    # User should not be nil
    if @user && @user.update_attributes(active: true)
      # Success
      flash[:success] = "이메일 인증이 성공적으로 되었습니다."
      redirect_to profile_path
    else
      # Failed
      render root_path
    end
  end

  def edit
    # Edit User Basic informations
    # Except Password and Email
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      # Success
      flash[:success] = "Edit!"
      redirect_to profile_path
    else
      # Failed
      render 'edit'
    end
  end

  def edit_password
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user.update_attributes(user_params)
      # Success
      flash[:success] = "새로운 패스워드로 변경되었습니다. 다시 로그인해주세요."
      sign_out
      redirect_to signin_path
    else
      # Failed
      render 'edit_password'
    end
  end

  def edit_email
    @user = current_user
  end

  def update_email
    @user = current_user
    if @user.update_attributes(user_params)
      # Success
      flash[:success] = "새로운 마이스누 아이디로 변경되었습니다. 인증 메일이 발송되었습니다."
      @user.update_attributes(activation_token: User.encrypt(User.new_remember_token))
      @user.update_attributes(active: false)
      send_activation_email(@user)
      redirect_to profile_path
    else
      # Failed
      render 'edit_email'
    end
  end

  def forgot_password
  end

  def reset_password
    @user = User.find_by(mysnu: user_params[:mysnu])
    new_password = random_string_size_of(8)
    @user.update_attributes(password: new_password,
                            password_confirmation: new_password)
    send_password_reset_email(@user, new_password)
    redirect_to root_path
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :mysnu, :password, :password_confirmation)
    end

    def send_activation_email(user)
      UserMailer.activation_email(@user).deliver
    end

    def send_password_reset_email(user, password)
      UserMailer.password_reset_email(user, password).deliver
    end

    # Before Filters

    def corrent_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
