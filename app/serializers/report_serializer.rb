class ReportSerializer < ActiveModel::Serializer
  attributes :BA, :SLG, :OBP, :OPS
  def BA
    object.BA.round(3)
  end

  def SLG
    object.SLG.round(3)
  end

  def OBP
    object.OBP.round(3)
  end

  def OPS
    object.OPS.round(3)
  end
end
