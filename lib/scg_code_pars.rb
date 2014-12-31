$: << File.expand_path( "." )

class CodePars
  def initialize( )
  end
  
  #virtual
  def get_unit( modul, unit )
    raise ( "Error: virtual method!!")
  end
  
end