class OpenProject::Release::Hooks < Redmine::Hook::ViewListener
  render_on :view_admin_info_top,
            :partial => '/info_top'
end
