class DashboardController < ApplicationController

    def index
        @user_groups = UserGroup.where(user: current_user)
        @incomes = Income.order(income_value: :desc)
        @payment_installments = PaymentInstallment.all
        # @expenses = Expense.where(annual_management: AnnualManagement.where(year: Time.zone.now.year), month: Time.now.month)
        @expenses = Expense&.last&.expense_groups
        @primary_expenses = ExpenseCategory.where(primary_payment: true)
        @annual_managements = AnnualManagement.by_user(current_user)
    end

    def warning_annual
    end

    def example
    end

    private

end