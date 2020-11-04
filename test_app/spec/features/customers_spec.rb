require 'rails_helper'

# Capybara para teste da view
RSpec.feature "Customers", type: :feature, js: true do
  it 'Visit index page' do
    visit(customers_path)
    # printa todo html da pagina
    print page.html

    # Tira um print da tela
    page.save_screenshot('screenshot.png')

    # Verifica se a pagina atual foi a que visitou
    expect(page).to have_current_path(customers_path)
  end
end
