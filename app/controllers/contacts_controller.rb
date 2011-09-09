class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if verify_recaptcha(@contact) && @contact.valid?
        ContactMailer.notification(@contact).deliver
        ContactMailer.confirmation(@contact).deliver
        
        format.html { redirect_to(new_contact_path, :flash => {:success => 'Message successfully sent.'}) }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
