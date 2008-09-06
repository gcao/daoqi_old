class Object
  def as_(string_to_localize, *args)
    #args.empty? ? string_to_localize : (sprintf string_to_localize, *args)
    return nil if string_to_localize.nil?
    args.empty? ? string_to_localize.t : (sprintf string_to_localize.t, *args)
  end
end
