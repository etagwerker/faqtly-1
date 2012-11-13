# coding: utf-8

module Permalinker

  # Converts a string into a URL friendly string.
  # 
  # @param [String] Unescaped input
  # @return [String] Escaped URL
  def escape_for_url(string = '')
    result = Rack::Utils.escape(string).gsub(/\+/,'-')
  end

  # Generates a permalink getting rid of unwanted 
  # special characters.
  # 
  # @param [String] Unescaped string
  # @return [String] Clean and escaped string
  def generate_permalink(string = '')
    return '' if string.nil?
    s = string.gsub(/[¿\?]/,'')
    s = s.gsub(/\+/,'-').downcase
    escape_for_url(s)
  end
end
