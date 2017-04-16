# Observer
class DocumentSweeper < ActionController::Caching::Sweeper
  observe Document

  def after_create(document)
    expire_action(controller: '/documents', action: %w(index show), id: document.id)
    expire_action(controller: '/posts', action: %w(index), category_id: document.category_id)
  end

  def after_update(document)
    expire_action(controller: '/documents', action: %w(index show))
    expire_action(controller: '/posts', action: %w(index), category_id: document.category_id)
  end

  def after_destroy(document)
    expire_action(controller: '/documents', action: %w(index show))
    expire_action(controller: '/posts', action: %w(index), category_id: document.category_id)
  end
end
