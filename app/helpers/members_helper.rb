module MembersHelper
  def membership_icon membership
    if membership
      content_tag(:i, "", class: "fa fa-check")
    else
      content_tag(:i, "", class: "fa fa-times")
    end
  end
end
