module TeamsHelper

  def andon_color
    if @team.andon == "green"
      "andon0"
    elsif @team.andon == "yellow"
      "andon1"
    else
      "andon2"
    end
  end

end
