# Observer
class PostSweeper < ActionController::Caching::Sweeper
  observe Post, Translation, Transcript

  def after_create(_record)
    expire_action(controller: '/posts', action: %w(index))
  end

  def after_update(record)
    if record.instance_of? Post
      expire_action(controller: '/posts', action: %w(index show))
    else
      expire_action(controller: '/posts', action: %w(show), id: record.post.id, category_id: record.post.category.id)
    end
  end

  def after_destroy(record)
    if record.instance_of? Post
      expire_action(controller: '/posts', action: %w(index show))
    else
      expire_action(controller: '/posts', action: %w(show), id: record.post.id, category_id: record.post.category.id)
    end
  end
end
