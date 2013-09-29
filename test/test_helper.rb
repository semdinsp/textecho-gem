require 'rubygems'
require 'bundler/setup'
require 'stringio'
#require 'test/unit'
gem 'minitest'
require 'minitest/autorun' 
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require File.dirname(__FILE__) + '/../lib/textecho'
