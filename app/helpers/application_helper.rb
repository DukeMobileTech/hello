module ApplicationHelper
  def get_language(lang)
    Settings.languages.rassoc(lang).try(:first)
  end
end
