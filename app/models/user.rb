class User < ApplicationRecord


  belongs_to :organization, optional: :true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   attr_accessor :company_name, :company_domain   

    before_create :create_organization, if: Proc.new{|u| u.invitation_token.nil?}

       
    def create_organization
      
    organization = Organization.create(name: self.company_name, domain: self.company_domain)
    self.organization_id = organization.id
    end
 
end
