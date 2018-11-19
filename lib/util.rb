class Util
  @@mthemes_hash =Hash({Iic=>"C. Interinstitucional",
                   Cause=>"Apoyo a casos",
                   CaseCoordination:"Coordinación casos",
                   Derivation:"Derivación gabinete",Goal:"Metas",Project:"Proyectos"})
  def self.get_mtheme (theme)
    if theme.is_a?Iic

      return "C. Interinstitucional"
    elsif theme.is_a? Cause

     return "Apoyo a caso"

    elsif theme.is_a?  Iic


    "Coordinación caso"

    elsif theme.is_a? Derivation

    "Derivación de gabinete"

    elsif theme.is_a? Goal


    "Meta"

    elsif theme.is_a?Project
      "Proyecto"

    end

  end
  def self.get_mthemes_hash
    @@mthemes_hash
  end


end