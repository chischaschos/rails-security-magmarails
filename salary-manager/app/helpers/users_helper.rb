module UsersHelper
  def get_menu_items
    case current_user.role.title
      when 'admin' then [link_to('Create user', new_user_path),
        link_to('View users', users_path), link_to('Approve Raise', raises_path('approve')),
        link_to('Raises', raises_path)]
      when 'employee' then [link_to('Ask for a raise', new_raise_path),
        link_to('My Raises', raises_path), link_to('My Account', user_path(current_user))]
    end
  end
end

