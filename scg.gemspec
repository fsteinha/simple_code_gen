Gem::Specification.new do |s|
  s.name        = 'scg'
  s.version     = '0.0.0'
  s.date        = '2015-01-09'
  s.summary     = "simpple code genarator"
  s.description = "simple way for generation of code"
  s.authors     = ["fsteinha"]
  s.email       = 'fsteinha@web.de'
  s.files       = ["lib/scg.rb", 
                   "lib/scg_build_cc.rb",
                   "lib/scg_build.rb",
                   "lib/scg_code_gen_c.rb",
                   "lib/scg_code_gen.rb",
                   "lib/scg_code_pars_c.rb",
                   "lib/scg_code_pars.rb",
                   "lib/scg_module.rb",
                   "lib/scg_port.rb",
                   "lib/scg.rb",
                   "lib/scg_unit.rb",
                   "lib/scg_unit_test_c.rb",
                   "lib/scg_unit_test.rb",
                   "test/APlusB",
                   "test/test_a_plus_b.rb",
                   "test/unit_test_iAPlusB",
                   "test/unit_test_iAPlusB.c",
                   "test/APlusB/a_plus_b.c"]
  s.homepage    =
    'http://rubygems.org/gems/scg'
  s.license       = 'MIT'
end

