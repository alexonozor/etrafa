class User < ApplicationRecord
    validates :email, presence: true
    validates :email, uniqueness: true
    has_many :products
    has_many :posting_sources
    has_secure_password

    enum account_type: [:suppliyer, :buyer]

    #associations
    has_one :company
    
    def full_name
        self.first_name + " " + self.last_name 
    end
    

end
