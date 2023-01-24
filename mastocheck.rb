#!/usr/bin/env ruby
# frozen_string_literal: true

require 'nokogiri'
require 'byebug'
require 'openssl'
require 'http'

uri = ARGV[0] || 'https://pronoiac.org/links/'
@url = uri

def perform_request!
  response = HTTP[accept: 'text/html'].get(@url)
  @body = (response.to_s if response.code == 200) || nil
end

def link_back_present?
  return false if @body.empty?

  links = Nokogiri::HTML(@body).xpath('//a[contains(concat(" ", normalize-space(@rel), " "), " me ")]|//link[contains(concat(" ", normalize-space(@rel), " "), " me ")]')

  return unless links.any?

  links.each do |link|
    puts link['href'].downcase
  end
end

begin
  perform_request!

  return unless link_back_present?
rescue OpenSSL::SSL::SSLError, HTTP::Error, Addressable::URI::InvalidURIError
  puts "Error fetching link #{@url}: #{e}"
  exit 1
end
