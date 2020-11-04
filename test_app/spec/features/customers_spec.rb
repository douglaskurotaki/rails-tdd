require 'rails_helper'

# Capybara para teste da view
RSpec.feature "Customers", type: :feature do
  it 'Visit index page' do
    visit(customers_path)
    # printa todo html da pagina
    print page.html
    # Verifica se a pagina atual foi a que visitou
    expect(page).to have_current_path(customers_path)
  end
end
