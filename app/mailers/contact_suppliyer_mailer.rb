class ContactSuppliyerMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def send_inquiry(inquiry, product, owner)
        @inquiry = inquiry
        @product = product
        @owner = owner
        mail(to: @owner.email, subject: @inquiry[:subject] )
    end
    
end
