class Admin::MembersController < ApplicationController
  def index
    @members = Member.page(params[:page]).per(5)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
   @member = Member.find(params[:id])
    if @member.update(member_params)
       redirect_to admin_member_path(@member.id)
    else
       render :edit
    end
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :email, :user_status )
  end


end
