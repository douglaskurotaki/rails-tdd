require 'rails_helper'
require_relative '../support/new_customer_form'

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

  # Esperando requisicao ajax
  it 'Ajax' do
    visit(customers_path)
    click_link('Add Message')
    expect(page).to have_content('Yes!')
  end

  # Encontra os elementos html da pagina
  it 'Find' do
    visit(customers_path)
    click_link('Add Message')
    expect(find('#my-div').find('h1')).to have_content('Yes!')
  end

  it 'Creates a Customer - Page Object Pattern' do
    # Forma mais clean de se usar os testes
    new_customer_form = NewCustomerForm.new
    new_customer_form.login.visit_page.fill_in_with(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      address: Faker::Address.street_address
    ).submit

    expect(page).to have_content('Customer was successfully created')
  end
end
