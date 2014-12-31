$: << File.expand_path( "." )

require "scg_port"
require "scg_code_gen"


class CodeGenC < CodeGen
  def initialize
    super
  end
  
  def declaration ( port )
    raise ( "Error: Wrong class" ) if !port.kind_of?(Port)
  
    case port.class
    when Port_num
      return "int #{port.name};"
    when Port_int
      return "int #{port.name};"
    else
      return "int #{port.name};"    
    end
  
    return nil
  end
  
  def comparision ( operator1, operator2, ifequal = nil, ifnequal = nil, align_offset = 0 )

    if ( ifequal != nil )
      ret = _puts( "if ( #{operator1} == #{operator2} )")
      align_plus(align_offset)
      ret << block_open()
      ret << _puts( ifequal)
      ret << block_close()
      if ( ifnequal != nil )
        ret << _puts( "else" )
        ret << block_open()
        ret << _puts( ifnequal)
        ret << block_close()
      end
    elsif ( ifnequal != nil )
      ret = _puts( "if ( #{operator1} != #{operator2} )")
      align_plus(align_offset)
      ret << block_open()
      ret << _puts( ifnequal)
      ret << block_close()      
    end

    align_minus(align_offset)
    
    return ret
  end

  #virtual
  def include (modul)
    _puts( "#include \"#{modul}\"" )
  end

  def block_open ( )
    ret = _puts( "{" )
    align_plus
    return ret
  end
  
  def block_close ( )
    align_minus
    ret = _puts( "}" )
    return ret
  end

end