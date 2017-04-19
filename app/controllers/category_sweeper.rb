# # Observer
# class CategorySweeper < ActionController::Caching::Sweeper
#   observe Category
#
#   def after_create(_category)
#     expire_action(controller: '/categories', action: 'index')
#   end
#
#   def after_update(_category)
#     expire_action(controller: '/categories', action: 'index')
#   end
#
#   def after_destroy(_category)
#     expire_action(controller: '/categories', action: 'index')
#   end
# end
