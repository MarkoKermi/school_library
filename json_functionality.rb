require 'json'

module JsonFunctionality
  def to_json_custom(options={})
  obj = {}
  instance_variables.map do |var|
    obj[var] = instance_variable_get(var)
  end
  return JSON.dump(obj)
 end
  def from_json(json_string)
    obj= JSON.parse(json_string,{:symbolize_names => true})
    obj.keys.each do |key|
      instance_variable_set(key, obj[key])
    end
  end
end