class ContactsController < ApplicationController
    
    def new
        @contact=Contact.new
    end
    
    
    def create
        @contact=Contact.new(contact_param)
        
        if @contact.save
            flash[:success]="Message sent."
            redirect_to new_contact_path
        else
            flash[:danger]="Error occured."
            redirect_to new_contact_path
        end
    end
    
    private
    
        def contact_param
            params.require(:contact).permit(:name,:email,:comments)
        end
end