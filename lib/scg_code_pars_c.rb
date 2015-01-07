$: << File.expand_path( "." )

require "scg_code_pars"

class CodeParsC < CodePars
  def initialize( )
  end
  
  #virtual
  def get_unit( modul_name, unit_name )
    file_modul = File.open( modul_name, "rb" )
    
    raise (" Error: Could not open #{modul_name} ") if ( file_modul == nil )
    
    read_in = file_modul.read()
    file_modul.close
    
    if ((start_index = read_in.index(unit_name)) == nil)
      raise (" Error: Could not find #{unit_name} in #{modul_name} ") if ( file_modul == nil )
    end  
    
    bracket_cnt = 0
    b_bracket_open=false
    end_index = nil
    
    start_index.upto(read_in.length).each do |index|
      if read_in[index] == '{'
        bracket_cnt = bracket_cnt + 1
        b_bracket_open = true if !b_bracket_open
      end
      
      if read_in[index] == '}'
        raise ("Error: no valid Block \n") if !b_bracket_open
        bracket_cnt =  bracket_cnt - 1
        
        if bracket_cnt <= 1
          end_index = index
          break
        end 
      end
    end
    
    raise ("Error: no valid Block \n") if (end_index == nil) || (start_index >= end_index) 
    
    new_start_index = nil
    start_index.downto(0).each  do |index|
      if read_in[index] == ';'
        new_start_index = index + 1
        break 
      end
      
      if read_in[index] == '#'
        new_start_index = index 
        break 
      end  
    end 
    
    start_index = new_start_index
    return read_in[start_index..end_index] 
  end  
end