# Test class for Rspec learning

class HelloWorld
  def say_hello
    'Hello Anu'
  end
end

describe HelloWorld do
  context 'when testing the HeljjgugyuloWorld class' do
    it "shuld say 'Hello Anu' when we call the method say_hello" do
      hw = HelloWorld.new
      message = hw.say_hello
      expect(message).to eq 'Hello Anul'
    end
  end
end
