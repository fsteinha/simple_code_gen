$: << File.expand_path( "." )

require "scg_port"


class CodeGen
  def initialize( align_offset = 0, align_offset_cur = 2)
    @align_offset = align_offset
    @align_offset_cur = align_offset_cur
  end
  
  #virtual
  def set_port_declaration ( port )
    raise ( "Error: virtual method!!")
  end
  
  #virtual
  def comparision ( operator1, operator2, ifequal = nil, ifnequal = nil)
    raise ( "Error: virtual method!!")
  end
  
  #virtual
  def block_open ( )
    raise ( "Error: virtual method!!")
  end

  #virtual
  def block_close ( )
    raise ( "Error: virtual method!!")
  end
  
  #virtual
  def include(modul)
    raise ( "Error: virtual method!!")
  end

  #virtual
  def _return(value)
    raise ( "Error: virtual method!!")
  end

  #virtual
  def comment(comment)
    raise ( "Error: virtual method!!")
  end

  #virtual
  def comment_bock(a_comment, page_width)
    raise ( "Error: virtual method!!")
  end

  #virtual
  def set_constant(constant_name, value)
    raise ( "Error: virtual method!!")
  end

  #virtual
  def set_constant(constant_name, value)
    raise ( "Error: virtual method!!")
  end

  #virtual
  def const_true(constant_name, value)
    raise ( "Error: virtual method!!")
  end

  #virtual
  def const_false(constant_name, value)
    raise ( "Error: virtual method!!")
  end

  def _write(content)
    ret = ""
    @align_offset.times { ret << ' ' }
    ret << content
    return ret
  end
  
  def _puts(content='')
    return _write(content + "\n")
  end
  
  def align_plus( offset = nil )
    if ( offset == nil )    
      @align_offset = @align_offset + @align_offset_cur
    else
      @align_offset = @align_offset + offset
    end
    @align_offset = 0 if @align_offset < 0      
  end 
  
  def align_minus( offset = nil )
    if ( offset == nil )    
      @align_offset = @align_offset - @align_offset_cur
    else
      @align_offset = @align_offset - offset
    end
    @align_offset = 0 if @align_offset < 0
  end 
  
  
end