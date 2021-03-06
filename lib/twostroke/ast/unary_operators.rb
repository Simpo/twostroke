module Twostroke::AST
  [ :PostIncrement, :PreIncrement, :PostDecrement, :PreDecrement, :Delete,
    :BinaryNot, :UnaryPlus, :Negation, :TypeOf, :Not, :Void, :BracketedExpression ].each do |op|
      klass = Class.new Base do
        attr_accessor :value
        
        def walk(&bk)
          if yield self
            value.walk &bk
          end
        end
      end
      const_set op, klass
    end
end