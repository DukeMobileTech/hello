module ApplicationHelper
  def get_language(lang)
    Settings.languages.rassoc(lang).first
  end
end
