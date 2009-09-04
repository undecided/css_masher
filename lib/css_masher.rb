$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))


# CssMasher: The answer to all your css mashing needs!
# Down, dirty, probably full of bugs, but quickly allows you to play with your
# css the way you want to.
class CssMasher
  def add_block(css)
    @css = css
  end

  def to_hash
    CssMasher::Parser.parse!(@css)
  end
end


require 'version'
require 'css_masher/parser'
