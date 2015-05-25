Given(/^I am not yet playing$/) do
end

When(/^I start a new game$/) do
  game = Codebreaker::Game.new(out_put)
  game.start
end

Then(/^I should see "([^"]*)"$/) do |message|
  expect(out_put.messages).to include(message)
end

class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def out_put
  @output ||= Output.new
end
