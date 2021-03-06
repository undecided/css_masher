


class CssMasher::Parser
  def self.parse!(css_string)
    parser = self.new(css_string)

    parser.to_hash
  end


  def initialize(css)
    @css = css
  end

  def to_hash
    regex = /\s*([^\s]+?)\s*\{\s*(.*?)\s*\}\s*/

    match = @css.scan(regex)

    output = match.inject({}) do |hash, clause|
      hash[clause[0].to_sym] = hash_attributes(clause[1])
      hash
    end
  end

  private

  def hash_attributes(attributes_string)
    regex = /\s*([^\s:]+)\s*:\s*([^;]+)\s*;*\s*/

    match = attributes_string.scan(regex)

    output = match.inject({}) do |hash, clause|
      hash[clause[0].to_sym] = clause[1]
      hash
    end
  end
end
