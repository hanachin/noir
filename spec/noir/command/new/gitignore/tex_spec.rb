require 'noir'
require 'spec_helper'

describe 'Noir::Command::New::GitIgnore::Tex' do
  it 'is TerminalCommand' do
    expect(Noir::Command::New::GitIgnore::Tex.superclass).to eq(Noir::Base::TerminalCommand)
  end
end