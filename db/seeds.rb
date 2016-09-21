unless Division.count > 1
  divisionlist = ["Global", "HTC", "Holtec Manufacturing Division", "Holtec International", "Orrvilon", "Holtec Asia - Pune", "Holtec Asia - AMD", "	Holtec - Ukraine"]

  divisionlist.each do |name|
    Division.create( name: name )
  end
end