# Observer
class PostSweeper < ActionController::Caching::Sweeper
  observe Post, Translation, Transcript

  def after_create(record)
    if record.instance_of? Post
      expire_action(controller: '/posts', action: %w(index))
    else
      expire_action(controller: '/posts', action: %w(index), category_id: record.post.category_id)
      expire_action(controller: '/posts', action: %w(language), id: record.post.id, category_id: record.post.category.id, language: record.language)
    end
  end

  def after_update(record)
    if record.instance_of? Post
      expire_action(controller: '/posts', action: %w(index))
      post_languages(record).each do |lang|
        expire_action(controller: '/posts', action: %w(language), id: record.id, category_id: record.category_id, language: lang)
      end
    else
      expire_action(controller: '/posts', action: %w(index), category_id: record.post.category_id)
      expire_action(controller: '/posts', action: %w(language), id: record.post.id, category_id: record.post.category.id, language: record.language)
    end
  end

  def after_destroy(record)
    if record.instance_of? Post
      expire_action(controller: '/posts', action: %w(index))
      post_languages(record).each do |lang|
        expire_action(controller: '/posts', action: %w(language), id: record.id, category_id: record.category_id, language: lang)
      end
    else
      expire_action(controller: '/posts', action: %w(index), category_id: record.post.category_id)
      expire_action(controller: '/posts', action: %w(language), id: record.post.id, category_id: record.post.category.id, language: record.language)
    end
  end

  def post_languages(record)
    langs = record.languages ||= []
    langs << 'en' unless langs.include? 'en'
    langs
  end
end
