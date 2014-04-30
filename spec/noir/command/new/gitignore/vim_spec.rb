require 'noir'
require 'spec_helper'

describe 'Noir::Command::New::GitIgnore::Vim' do
  it 'is TerminalCommand' do
    expect(Noir::Command::New::GitIgnore::Vim.superclass).to eq(Noir::Base::TerminalCommand)
  end

  it 'is create .gitignore by Noir::Command::New.createFile' do
    allow(Noir::Command::New).to receive(:createFile)
    expect(Noir::Command::New).to receive(:createFile).with('.gitignore', anything)
    Noir::Command::New::GitIgnore::Vim.execute
  end
end

