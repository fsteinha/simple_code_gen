$: << File.expand_path( "." )

require "scg_port"

class UnitOutput
  attr_reader:name
  attr_reader:port
  attr_reader:rule
  attr_reader:a_rule_param
  def initialize( port, rule, *a_rule_param )
    raise ( "Error: Wrong class" ) if !port.kind_of?(Port)
    raise ( "Error: Wrong class" ) if !rule.kind_of?(Proc)
    raise ( "Error: first param is the output" ) if a_rule_param.length < 1
    @port = port
    @name = port.name
    @rule = rule
    @a_rule_param = a_rule_param
  end
end

class Unit
  attr_reader:name
  attr_reader:a_local_input   # local inputs (parameters)
  attr_reader:a_local_output  # local outputs (returns)
  attr_reader:a_global_input  # global inputs
  attr_reader:a_global_output # global outputs 

  def initialize( name, description = nil )
    @name = name
    @a_local_input = []   # local inputs (parameters)
    @a_local_output = []  # local outputs (returns)
    @a_global_input = []   # global inputs
    @a_global_output = []  # global outputs 
    @description = description
  end

  def add_local_input( input )
    raise("ERROR: wrong class (#{input.class}))") if !input.kind_of?(Port)
    @a_local_input << input
  end
  
  def add_global_input( input )
    raise("ERROR: wrong class (#{input.class}))") if !input.kind_of?(Port)
    @a_global_input << input
  end
  
  def << ( input )
    return add_local_input(input)
  end

  def <= ( input )
    return add_global_input(input)
  end
  
  def add_local_output( output )
    raise("ERROR: wrong class (#{output.class}))") if !output.kind_of?(UnitOutput)
    @a_local_output << output
  end

  def add_global_output( output )
    raise("ERROR: wrong class (#{output.class}))") if !output.kind_of?(UnitOutput)
    @a_global_output << output
  end

  def >> ( output )
    return add_local_output(output)
  end

  def >= ( output )
    return add_global_output(output)
  end

end

class Unit_glob < Unit
end