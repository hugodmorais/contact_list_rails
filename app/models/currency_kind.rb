class CurrencyKind < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    has_many :accounts
    
    # Delegates
    
    # Constants
    
    # Scopes
    scope :by_user, ->(user) { where(user_id: user.id) }
    
    # Callbacks
    
    # Validations
    validates :name, presence: true

    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    
    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
