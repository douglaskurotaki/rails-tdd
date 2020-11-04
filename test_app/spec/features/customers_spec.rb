require 'rails_helper'

# Capybara para teste da view
RSpec.feature "Customers", type: :feature, js: true do
  it 'Visit index page' do
    visit(customers_path)
    # printa todo html da pagina
    # print page.html

    # Tira um print da tela
    # page.save_screenshot('screenshot.png')

    # Verifica se a pagina atual foi a que visitou
    expect(page).to have_current_path(customers_path)
  end

  # Simula o processo de preenchimento de formulario ate o click do botao
  it 'Create a Customer' do
    member = create(:member)
    # usando o devise podemos fazer dessa forma usando o member no login
    login_as(member, :scope => :member)
    visit(new_customer_path)
    # fill_in eh a forma de preencher o campo
    fill_in('Name', with: Faker::Name.name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Address', with: Faker::Address.street_address)
    # Simula o aperto do botao respectivo o nome contido nele
    click_button('Create Customer')
    # Espera uma resposta com o conteudo
    expect(page).to have_content('Customer was successfully created')
  end
end
