describe (1..5), 'Ranges' do
  it '#cover' do
    # Que contenha o valor no parametro referente ao range (1..5)
    expect(subject).to cover(2)
    expect(subject).to cover(2, 5)
    expect(subject).not_to cover(0, 6)
  end
end