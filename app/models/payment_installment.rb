# == Schema Information
#
# Table name: payment_installments
#
#  id                  :bigint           not null, primary key
#  name                :string
#  start_date          :date             not null
#  months_number       :integer
#  total_value         :decimal(, )
#  store_name          :string
#  description         :string
#  deposit_money       :decimal(, )
#  monthly_installment :decimal(, )
#  amount_already_paid :decimal(, )
#  user_id             :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_payment_installments_on_user_id  (user_id)
#

class PaymentInstallment < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    belongs_to :user
    
    # Constants
    
    # Scopes
    
    # Callbacks
    after_initialize :calculate_monthly_installment
    after_initialize :number_of_months

    # Validations
    validates :name, :start_date, :months_number, :total_value, :deposit_money, presence: true
    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    def to_s
    end

    def percentage_calculate(total, partial)
        return unless total.present? || partial.present?
        puts total
        puts partial
        value = ((partial * 100 / total)/100)
        return value
    end

    def number_of_months
        return unless start_date?

        (((Date.today - start_date).to_f)/30.1).round
    end
 
    def calculate_monthly_installment
        return if self.number_of_months.nil?
        self.amount_already_paid = (number_of_months * deposit_money) + monthly_installment 
    end

    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
