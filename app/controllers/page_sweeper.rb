# Observer
class PageSweeper < ActionController::Caching::Sweeper
  observe Page

  def after_create(page)
    expire_action(controller: '/posts', action: %w(index), category_id: page.category_id)
  end

  def after_update(page)
    expire_action(controller: '/posts', action: %w(index), category_id: page.category_id)
  end

  def after_destroy(page)
    expire_action(controller: '/posts', action: %w(index), category_id: page.category_id)
  end
end
