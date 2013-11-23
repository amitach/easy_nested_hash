class Hash
  
  def get(input_hash)
    ret = self
    input_hash.split('.').each do |p|
      if p.to_i.to_s == p
        ret = ret[p.to_i]
      else
        ret = ret[p.to_sym] || ret[p.to_s]
      end
      break unless ret
    end
    ret
  end
end