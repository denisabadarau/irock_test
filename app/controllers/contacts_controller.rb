class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    normalized_email = @contact.email.to_s.strip.downcase

    if @contact.invalid?
      render :new, status: :unprocessable_entity
    elsif Contact.exists?(email: normalized_email)
      redirect_to thank_you_path
    elsif @contact.save
      redirect_to thank_you_path
    else
      render :new, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    redirect_to thank_you_path
  end

  def thank_you
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email)
  end
end
