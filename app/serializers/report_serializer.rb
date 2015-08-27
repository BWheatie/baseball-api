class ReportSerializer < ActiveModel::Serializer
  attributes :BA, :H, :RBI, :HR
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

  def ISO
    object.ISO.round(3)
  end

  def BABIP
    object.BABIP.round(3)
  end

  def FP
    object.FP.round(3)
  end

  def IP
    object.IP.round(3)
  end

end
