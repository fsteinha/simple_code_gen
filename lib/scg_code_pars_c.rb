$: << File.expand_path( "." )

class CodePars
  def initialize( )
  end
  
  #virtual
  def get_unit( modul, unit )
    file_modul = File.open( modul, "rb" )
    
    raise (" Error: Could not open #{modul} ") if ( file_modul == nil )
      
    
  end
  
end