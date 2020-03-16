class SignupController < ApplicationController
  def top
    @user = User.new
  end

  def second
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:emile]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:first_name] = user_params [:first_name]
    session[:first_name_kana] = user_params [:first_name_kana]
    session[:family_name] = user_params [:family_name]
    session[:family_name_kana] = user_params [:family_name_kana]
    session[:birth_year] = user_params [:birth_year]
    session[:birth_month] = user_params [:birth_month]
    session[:birth_day] = user_params [:birth_day]
    @user = User.new
  end

  def third
    session[:post_code] = user_params [:post_code]
    session[:prefecture_code] = user_params [:prefecture_code]
    session[:city] = user_params [:city]
    session[:house_number] = user_params [:house_number]
    session[:building_name] = user_params [:building_name]
    session[:phone_number] = user_params [:phone_number]
    @user = User.new
  end

  def create
    @user = User.new(
    nickname: session[:nickname],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    email: session[:email],
    first_name: session[:first_name],
    first_name_kana: session[:first_name_kana],
    family_name: session[:family_name],
    family_name_kana: session[:family_name_kana],
    birth_year: session[:birth_year],
    birth_month: session[:birth_month],
    birth_day: session[:birth_day],
    post_code: session[:post_code],
    prefecture_code: session[:prefecture_code],
    city: session[:city],
    house_number: session[:house_number],
    building_name: session[:building_name],
    phone_number: session[:phone_number],
    )
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '#'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private
    def user_params
      params.require(:user).permit(
        :nickname, 
        :email, 
        :password, 
        :password_confirmation, 
        :first_name, 
        :family_name, 
        :first_name_kana, 
        :family_name_kana, 
        :birth_year,
        :birth_month,
        :birth_day,
        :post_code,
        :prefecture_code,
        :city,
        :house_number,
        :building_name,
        :phone_number,
      )
    end
  
end
