module EventsHelper
  def invite_people
    if current_user == @event.creator
      content_tag(:div,
                  link_to('Invite People', attendances_path(event_id: @event.id),
                          class: 'btn btn-primary text-uppercase'))

    elsif @is_attendy
      content_tag(:div,
                  link_to('Withdraw', attendances_path(event_id: @event.id), method: :patch,
                                                                             class: 'btn btn-primary text-uppercase'))
    else
      content_tag(:div,
                  link_to('Join Event', attendances_path(event_id: @event.id), method: :patch,
                                                                               class: 'btn btn-primary text-uppercase'))
    end
  end
end
