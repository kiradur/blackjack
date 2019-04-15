class Card
  def initialize(import, face)
    @import = import
    @face = face
  end

  def total_value
    return @face if @face.is_a?(Integer)
    @face.eql?('A') ? 11 : 10
  end

  def display
    "#{@face}#{@import}"
  end
end
