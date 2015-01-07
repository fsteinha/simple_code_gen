$: << File.expand_path( "." )

require "scg_build"

class BuildCC < Build
  
  def initialize()
    super    
  end
  
  def build(unit_test)
    puts `cc -Wall #{unit_test.test_file_name} -o #{unit_test.unit_test_exe_name}`
    puts `./#{unit_test.unit_test_exe_name}`
  end

  
end