module HumanizeParams
  def human_created_at
    created_at.strftime('%F %T')
  end
end
