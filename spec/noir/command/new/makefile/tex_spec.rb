require 'noir'
require 'spec_helper'

describe 'Noir::Command::New::Makefile::Tex' do
  it 'is TerminalCommand' do
    expect(Noir::Command::New::Makefile::Tex.superclass).to eq(Noir::Base::TerminalCommand)
  end
end

