# Observer
class ResourceSweeper < ActionController::Caching::Sweeper
  observe Resource

  def after_create(resource)
    expire_action(controller: '/posts', action: %w(index), category_id: resource.post.category_id)
  end

  def after_update(resource)
    expire_action(controller: '/posts', action: %w(index), category_id: resource.post.category_id)
  end

  def after_destroy(resource)
    expire_action(controller: '/posts', action: %w(index), category_id: resource.post.category_id)
  end
end
