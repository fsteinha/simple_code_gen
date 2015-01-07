require "rubygems"

class Port
  attr_reader:name 
  attr_reader:a_value_valid 
  attr_reader:a_value_unvalid 
  attr_reader:value 
  attr_reader:declaration

  def initialize( name , declaration = nil)
    @name = name
    @a_value_valid = []
    @a_value_unvalid = []
    @value = nil
    @declaration = declaration    
  end   

  def set_value( value )
    @value = value
    #Todo
    #@a_value_valid.each { | item | @value = value if item == value; return }
    #@a_value_unvalid.each { | item | @value = value if item == value; return }
  end
end

class Port_num < Port
  def initialize( name, lower_limit = nil, upper_limit = nil, *a_specific_values )
    super( name )
    @lower_limit = lower_limit
    @upper_limit = upper_limit
    if @lower_limit != nil && @upper_limit != nil
      raise ( "Error: values not valid !!" ) if !@lower_limit.kind_of?( Numeric )
      raise ( "Error: values not valid !!" ) if !@upper_limit.kind_of?( Numeric )
      raise ( "Error: values not valid !!" ) if @lower_limit >= @upper_limit
      
      @a_value_unvalid << @lower_limit - 1
      @a_value_unvalid << @upper_limit + 1
      @a_value_valid << @lower_limit
      @a_value_valid << ((( upper_limit - lower_limit ) >> 1 ) + lower_limit )
      @a_value_valid << @upper_limit

    elsif a_specific_values.length > 0
      a_specific_values.each { |item| raise ( "Error: values not valid !!" ) if item.kind_of( Numeric ) }
      @a_value_valid = a_specific_values
    else    
      0.upto(2) { | idx | @a_value_valid << idx * 1100 }
    end
  end    
end

class Port_int < Port_num
  def initialize( name, lower_limit = nil, upper_limit = nil, *a_specific_values )
    super
    a_value_valid.each { |item| raise ( "Error: values not valid !!" ) if !item.kind_of?( Integer ) }
    a_value_unvalid.each { |item| raise ( "Error: values not valid !!" ) if !item.kind_of?( Integer ) }
    
  end
end
