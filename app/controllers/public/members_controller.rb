class Public::MembersController < ApplicationController
  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :email )
  end
end
