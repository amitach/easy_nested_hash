require 'spec_helper'
require 'easy_nested_hash'

describe "easy_nested_hash" do 
  it "Should return nil for empty hash" do 
  	h = Hash.new 
  	h["somekey"].should be_nil
  end

  it "Should return value for existing key in the hash for method get" do 
  	h = Hash.new 
  	h["somekey"] = "value"
  	h.get("somekey").should == "value"
  end

  it "Should get nested values using the dot" do
  	h = {"a" => {"b" => {"c" => "nested_hash_value"}}}
  	h.get("a.b.c").should == "nested_hash_value"
  end

  it "Should get nested values using the dot operator irrespective of symbol or string" do
  	h = {:a => {:b => {"c" => "nested_hash_value"}}}
  	h.get("a.b.c").should == "nested_hash_value"
  end


  it "Should get nested values using the dot operator irrespective of symbol or string" do
  	h = {:a => {:b => {"c" => ["This is cool"]}}}
  	i = {:a => {:b => {"c" => h.get("a.b.c")}}}
  	i.get("a.b.c").should == ["This is cool"]
  end

  it "if the value is an array can be accessed with integers" do
  	h = {:a => [{:b => {:c => "nested_hash"}}]}
  	h.get("a.0.b.c").should == "nested_hash"
  end
end
