require 'bank'

describe Bank do
  it 'should respond to #deposit method' do
    expect(subject).to respond_to(:deposit)
  end
  
end