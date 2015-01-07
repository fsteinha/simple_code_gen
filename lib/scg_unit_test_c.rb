$: << File.expand_path( "." )

require "scg_unit_test"
require "scg_code_gen_c"
require "scg_code_pars_c"
require "scg_build_cc"

class UnitTest_c < UnitTest
  
  def initialize( unit, scg_module, test_file_name = nil, 
                    test_file_name_extension = ".c", 
                    editor_col_count=79, unit_test_suffix = "unit_test",
                    code_gen = CodeGenC.new, code_pars = CodeParsC.new,
                    build = BuildCC.new)
    super
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
      _puts( @code_gen.set_port_declaration(@unit.a_local_output[0].port) )
    end
    
  end
  
  def make_test_exec
   # puts @code_gen.inspect
   # @code_gen.comment_bock(["Execute the test"], @editor_col_count)
    _puts ( "#include <stdio.h>" )
    _puts ( "int main (void)" )
    _puts ( "{")
    _puts ( "  int iTestRun = 0;" )
    _puts ( "  int iTestSuccessfull = 0;" )
    _puts ( "  int iTestNotSuccessfull = 0;" )
               
    @a_tests.each do |test|
      _puts
      _puts ( "  printf(\"Run #{test}: \");" )
      _puts ( "  iTestRun++;")
      _puts ( "  if ( #{test}() == 1 )")
      _puts ( "  {")
      _puts ( "    printf(\"Success\\n\");" )
      _puts ( "    iTestSuccessfull++;" )
      _puts ( "  }")
      _puts ( "  else" )
      _puts ( "  {")
      _puts ( "    printf(\"Failed\\n\");" )
      _puts ( "    iTestNotSuccessfull++;" )
      _puts ( "  }")
    end
    
    _puts ( "  printf(\"Summary\\n\");" )     
    _puts ( "  printf(\"=======\\n\");" )     
    _puts ( "  printf(\"Test run %d\\n\", iTestRun);" )
    _puts ( "  printf(\"Test sucessfull %d\\n\", iTestSuccessfull);" )
    _puts ( "  printf(\"Test not sucessfull %d\\n\", iTestNotSuccessfull);" )     
    _puts ( "  printf(\"Result: \");" )     
    _puts ( "  if (iTestNotSuccessfull > 0)")    
    _puts ( "  {")
    _puts ( "    printf(\"Failure\");" )     
    _puts ( "    return -1;")    
    _puts ( "  }")
    _puts ( "  printf(\"Success\");" )     
    _puts ( "  return 0;")    
    _puts ( "}")    
  end

end
