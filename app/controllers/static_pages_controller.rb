class StaticPagesController < ApplicationController
  before_filter :authorize

  def home
     @quotes = Quote.where(:is_paid => 'false', :mounth => Date.today.month, :year => Date.today.year)

     @sales = Sale.where(:id => @quotes.select('sale_id'))

     @people = Person.where(:id => @sales.select('person_id'))


  end

end
