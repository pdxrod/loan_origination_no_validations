module LoansHelper
end
class Object
  def negative_zero_or_empty?
    self == nil || (self.is_a?( String ) && self.strip == "") || (self.is_a?( Numeric ) && self.to_i < 1)
  end
end
