$: << File.expand_path( '.' )
$: << File.expand_path( '../lib' )

require "scg_unit"
require "scg_module"
require "scg_unit_test_c"


unit_a_plus_b = Unit.new( 'iAPlusB' )                         # new unit
unit_a_plus_b <= offset = Port_int.new( 'm_iOffset', 0, 10 ) # global offset valid from 0..10
unit_a_plus_b << ( a = Port_int.new( 'iA', -1000, 1000 ) )       # input as param valid from -1000..1000
unit_a_plus_b << b = Port_int.new( 'iB' )                     # input as param all valid

#local output (return of unit) with rule
unit_a_plus_b >> UnitOutput.new(Port_int.new( 'iC' ), Proc.new {| a, b, offset | a.value + b.value + offset.value }, a, b, offset) 

# Last iA should be stored in global output (
unit_a_plus_b >= UnitOutput.new(Port_int.new( 'm_iLastA' ), Proc.new {| a | a.value }, a) 

# Makes new Unittest
unit_test = UnitTest_c.new( unit_a_plus_b, Scg_module.new("AplusB.c") )
#Do it
unit_test.make

