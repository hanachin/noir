require 'noir'
require 'spec_helper'

describe 'Noir::Command::Help' do
  it 'is inherited Noir::Base::TerminalCommand' do
    expect(Noir::Command::Help.ancestors).to include(Noir::Base::TerminalCommand)
  end

  it 'is output when execute' do
    expect{Noir::Command::Help.execute}.to output.to_stdout
  end
end
