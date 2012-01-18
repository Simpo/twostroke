module Twostroke::AST
  class Array < Base
    attr_accessor :items
    
    def initialize(*args)
      @items = []
      super *args
    end
    
    def walk(&bk)
      if yield self
        items.each do |item|
          item.walk &bk
        end
      end
    end
  end
end