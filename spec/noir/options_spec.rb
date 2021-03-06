require 'noir'
require 'spec_helper'

describe 'Noir::Options' do

  it 'is Class' do
    expect(Noir::Options.class).to eq(Class)
  end

  describe 'Noir::Options.exist?' do
    after {Noir::Options.class_variable_set :@@options, {}}

    it 'is return false if argument is nil.' do
      expect(Noir::Options.exist? nil).to eq(false)
    end

    it '(Help) is return false if ARGV not include "-h"' do
      expect(Noir::Options.exist? Noir::Options::Help).to eq(false)
    end

    it '(Help) is return true if ARGV include "-h"' do
      stub_const('ARGV', ['-h'])
      Noir::Options.parse_options_from_argv!
      expect(Noir::Options.exist? Noir::Options::Help).to eq(true)
    end

    it '(Help) is return false if ARGV not include "--help"' do
      expect(Noir::Options.exist? Noir::Options::Help).to eq(false)
    end

    it '(Help) is return true if ARGV include "--help"' do
      stub_const('ARGV', ['--help'])
      Noir::Options.parse_options_from_argv!
      expect(Noir::Options.exist? Noir::Options::Help).to eq(true)
    end

    it 'exit with output version if ARGV include "-v"' do
      stub_const('ARGV', ['-v'])
      expect {
        expect{Noir::Options.parse_options_from_argv!}.to raise_error(SystemExit)
      }.to output('noir ' + Noir::VERSION + "\n").to_stdout
    end

    it 'exit with output version if ARGV include "--version"' do
      stub_const('ARGV', ['--version'])
      expect {
        expect{Noir::Options.parse_options_from_argv!}.to raise_error(SystemExit)
      }.to output('noir ' + Noir::VERSION + "\n").to_stdout
    end
  end

end
