$: << File.expand_path( "." )

require "scg_unit"
require "scg_module"

class UnitTest
  def initialize( unit, scg_module, test_file_name = nil, 
                    test_file_name_extension = nil, 
                    editor_col_count=79, unit_test_suffix = "unit_test" )
                    
    raise "Error: Wrong class" if !unit.kind_of?( Unit )
    raise "Error: Wrong value" if unit == nil
    raise "Error: Wrong class" if !scg_module.kind_of?( Scg_module )
    raise "Error: Wrong value" if scg_module == nil
    
    @unit = unit
    @module = scg_module
    if test_file_name != nil
      @test_file_name = test_file_name 
    else
      @test_file_name = "unit_test_" + unit.name
      @test_file_name = @test_file_name + test_file_name_extension  if test_file_name_extension != nil
    end
    @editor_col_count = editor_col_count
    @code_comment_line_sign = '#'
    @test_file = nil
    @unit_test_suffix = unit_test_suffix
    
    @unit.a_global_input.each { | input | input.set_value( input.a_value_valid[ 0 ] ) }
    @unit.a_local_input.each { | input | input.set_value( input.a_value_valid[ 0 ] ) }
    
    @align_offset = 0
    @align_char = ' '
  end
  
  def make
    @test_file = File.open(@test_file_name, "wb")
    
    write_include_module()
    @test_file.puts
    
    if (@unit.a_global_input.length > 0)
      @unit.a_global_input.each do | input |
        input.a_value_unvalid.each do | value |
          input.set_value( value )
          make_test()
        end
      
        input.a_value_valid.each do | value |
          input.set_value( value )
          make_test_loc()
        end      
      end
    else    
      make_test_loc()
    end
    
    @test_file.close
  end
  
  def make_test_loc
    @unit.a_local_input.each do | input |
      input.a_value_unvalid.each do | value |
        input.set_value( value)
        make_test()
      end

      input.a_value_valid.each do | value |
        input.set_value( value )
        make_test()
      end
    end
  end
  
  def make_test

    test_name = @unit_test_suffix.clone

    @unit.a_global_input.each do | input |
      if input.kind_of?( Port_num )
        value = input.value
        if (value < 0)
          value = "S" + value.abs.to_s
        end        
        test_name << "__#{input.name}_#{value}" if input.kind_of?( Port_num )
      end
    end    

    @unit.a_local_input.each do | input |
      if input.kind_of?( Port_num )
        value = input.value
        if (value < 0)
          value = "S" + value.abs.to_s
        end        
        test_name << "__#{input.name}_#{value}" if input.kind_of?( Port_num )
      end
    end    

    puts test_name

    # write the test
    write_open_unit_test(test_name)
    
    
    @unit.a_global_input.each do | input |
      write_set_input( input )
    end
    
    write_call_unit()
    
    write_output_check()
    
    write_close_unit_test()
   
    @test_file.puts    
  end
  
  
  def _write(content)
    @align_offset.times { @test_file.write( @align_char ) }
    @test_file.write("#{content}")
  end
  
  def _puts(content = '')
    _write(content + "\n")
  end

  # virtual must be written by successor
  def write_call_unit()
    raise ( "Error: virtual method!!")
  end

  # virtual must be written by successor
  def write_set_input( input )
    raise ( "Error: virtual method!!")
  end
  
  # virtual must be written by successor
  def write_open_unit_test( unit_test_name )
    raise ( "Error: virtual method!!")
  end
  
  # virtual must be written by successor
  def write_close_unit_test()
    @align_offset = 0
    _puts
    _puts( @code_gen.block_close)
  end

  def write_include_module
    _puts @code_gen.include( @module.name )
  end

  def write_output_check
    @unit.a_local_output.each do | output |
      param = output.a_rule_param
      param = output.a_rule_param[0] if output.a_rule_param.length <= 1
      _write ( @code_gen.comparision(output.name, output.rule.call(param), nil, "return 0;", @align_offset) )
    end
    
    @unit.a_global_output.each do | output |
      param = output.a_rule_param
      param = output.a_rule_param[0] if output.a_rule_param.length <= 1
      _write ( @code_gen.comparision(output.name, output.rule.call(param), nil, "return 0;", @align_offset) )
    end
    
  end
  
end