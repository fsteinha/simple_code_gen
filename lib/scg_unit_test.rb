$: << File.expand_path( "." )

require "scg_unit"
require "scg_module"
require "scg_build"

class UnitTest
  attr_reader:test_file_name
  attr_reader:unit_test_exe_name
  
  def initialize( unit, scg_module, test_file_name = nil, 
                    test_file_name_extension = nil, 
                    editor_col_count=79, unit_test_suffix = "unit_test",
                    code_gen = nil, code_pars = nil,
                    build = nil, unit_test_exe_name = nil)
                    
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
    
    if unit_test_exe_name != nil
      @unit_test_exe_name = unit_test_exe_name 
    else
      @unit_test_exe_name = "unit_test_" + unit.name
    end
          
    @editor_col_count = editor_col_count
    @code_comment_line_sign = '#'
    @test_file = nil
    @unit_test_suffix = unit_test_suffix
    
    @unit.a_global_input.each { | input | input.set_value( input.a_value_valid[ 0 ] ) }
    @unit.a_local_input.each { | input | input.set_value( input.a_value_valid[ 0 ] ) }
    
    @align_offset = 0
    @align_char = ' '
    
    @code_gen = code_gen
    @code_pars = code_pars
    
    @a_tests = []
      
    @build = build  
  end
  
  def make
    @a_tests = []
    @test_file = File.open(@test_file_name, "wb")
    
    write_global_port_instances()
    write_include_module()
    
    @test_file.puts
    
    _write( @code_gen.comment_block(["tests of unit"], @editor_col_count) )

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
    
    make_test_exec()
    
    @test_file.close
    
    @build.build(self) if @build != nil
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
    test_name << "__#{@a_tests.length}__"

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

    @a_tests << test_name
#    puts test_name

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
  def make_test_exec
    raise ( "Error: virtual method!!")    
  end
      
  def write_close_unit_test()
    @align_offset = 0
    _puts
    _puts( @code_gen._return(@code_gen.const_true))
    _puts( @code_gen.block_close)
  end
  
  def write_global_port_instances
    _write( @code_gen.comment_block(["global inputs"], @editor_col_count) )
    @unit.a_global_input.each do | port |
      _puts( @code_gen.set_port_declaration(port) )
    end

    _write( @code_gen.comment_block(["global outputs"], @editor_col_count) )
    @unit.a_global_output.each do | output |
      _puts( @code_gen.set_port_declaration(output.port) )
    end
  end
  
  def write_include_module
    #_puts @code_gen.include( @module.name )
    raise ("Error: NO code parser !!") if @code_pars == nil      
    _write( @code_gen.comment_block(["unit to be test", "extract from #{@module.name}"], @editor_col_count) )
    _write( @code_pars.get_unit( @module.name,@unit.name ) )
    _puts
  end

  def write_output_check
    @unit.a_local_output.each do | output |
      param = output.a_rule_param
      param = output.a_rule_param[0] if output.a_rule_param.length <= 1
      _write ( @code_gen.comparision(output.name, output.rule.call(param), nil, @code_gen._return(@code_gen.const_false), @align_offset) )
    end
    
    @unit.a_global_output.each do | output |
      param = output.a_rule_param
      param = output.a_rule_param[0] if output.a_rule_param.length <= 1
      _write ( @code_gen.comparision(output.name, output.rule.call(param), nil, @code_gen._return(@code_gen.const_false), @align_offset) )
    end
    
  end
  
end