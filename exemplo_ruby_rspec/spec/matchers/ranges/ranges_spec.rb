describe (1..5), 'Ranges' do
  it '#cover' do
    # Que contenha o valor no parametro referente ao range (1..5)
    expect(subject).to cover(2)
    expect(subject).to cover(2, 5)
    expect(subject).not_to cover(0, 6)

    # Substitui o expect(subject).to
    is_expected.to cover(2)
  end

  # Simplifica o it com o subject
  it { is_expected.to cover(2) }
  it { is_expected.to cover(2, 5) }
  it { is_expected.not_to cover(0, 6) }

  # Tambem pode utilizar a forma normal do subject
  it { expect(subject).to cover(2, 5) }
end