$: << File.expand_path( "." )

require "scg_unit_test"
require "scg_code_gen_c"

class UnitTest_c < UnitTest
  
  def initialize( unit, scg_module, test_file_name = nil, 
                    test_file_name_extension = ".c", 
                    editor_col_count=79, unit_test_suffix = "unit_test" )
    super
    @code_gen = CodeGenC.new
  end

  def write_call_unit()
    raise("Error c knows only one local output") if @unit.a_local_output.length > 1
    
    _write("#{@unit.a_local_output[0].name} = #{@unit.name}(")
    
    a_value = [ ]
    @unit.a_local_input.each { | input | a_value << "#{input.value}" }
    
    _puts( "#{a_value.join(', ')} );" )
    
  end

  def write_set_input( input )
    _puts( "#{ input.name } = #{ input.value };" )
  end

  def write_open_unit_test( unit_test_name )
    raise("Error c knows only one local output") if @unit.a_local_output.length > 1

    if @unit.class == Unit
      @test_file.write( "static " )
    end
    
    _write( "int "  + unit_test_name + "()"  )
    _puts
    _puts( "{" )
    
    @align_offset = @align_offset + 2

    if ( @unit.a_local_output[0].port.declaration != nil )
      _puts( @unit.a_local_output[0].port.declaration )
    else
      _puts( @code_gen.declaration(@unit.a_local_output[0].port) )
    end
    
  end
end
