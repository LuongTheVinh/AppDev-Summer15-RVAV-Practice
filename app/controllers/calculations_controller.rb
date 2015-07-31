class CalculationsController < ApplicationController
  def instructions
    render("instructions.html.erb")
  end

  def sq
    render('sq.html.erb')
  end

  def sqrt
    render('sqrt.html.erb')
  end

  def random
    render('random.html.erb')
  end

  def payment
    nb_months = 12 * params['nb_years'].to_i
    @annual_interest_rate = params['nb_basis_points'].to_f / 100.0
    @monthly_interest_rate = @annual_interest_rate / 12.0 / 100.0
    principal = params['loan_principal'].to_f

    npv = 0.0
    interest_per_month = @monthly_interest_rate * principal

    for t in 1..nb_months
      npv += interest_per_month / ((1.0 + @monthly_interest_rate) ** t)
    end

    npv += principal / ((1.0 + @monthly_interest_rate) ** nb_months)

    @monthly_payment = npv * @monthly_interest_rate / (1.0 - 1.0 / ((1 + @monthly_interest_rate) ** nb_months))

    render('payment.html.erb')
  end

end
