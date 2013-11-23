Easy Nested Hash
================

Simple gem to get nested hash values using dot notation

Examples:


h = Hash.new 
  	h["somekey"] = "value"
  	h.get("somekey").should == "value"
  	
  	
  	
h = {"a" => {"b" => {"c" => "nested_hash_value"}}}
  	h.get("a.b.c").should == "nested_hash_value"
  	
  	
  	
h = {:a => {:b => {"c" => ["This is cool"]}}}
  	i = {:a => {:b => {"c" => h.get("a.b.c")}}}
  	i.get("a.b.c").should == ["This is cool"]
  	
h = {:a => [{:b => {:c => "nested_hash"}}]}
  	h.get("a.0.b.c").should == "nested_hash"

