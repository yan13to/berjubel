# frozen_string_literal: true

# ProfileHelper
module ProfileHelper
  def render_profiles_avatar
    render 'profiles/avatar', avatar: current_user&.try(:profile).try(:avatar)
  end
end
