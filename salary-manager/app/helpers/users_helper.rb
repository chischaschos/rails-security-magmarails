module UsersHelper
  def get_menu_items
    case current_user.role.title
      when 'admin' then [link_to('Create user', new_user_path),
        link_to('View users', users_path), link_to('Pending Raise', '/'),
        link_to('Raise history', '/')]
    end
  end
end

