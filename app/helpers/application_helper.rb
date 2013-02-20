module ApplicationHelper
  def full_title(title=nil)
    if title.present?
      "#{title} | BabyNotes"
    else
      "BabyNotes"
    end
  end
end
