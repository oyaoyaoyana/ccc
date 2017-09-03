module GroupDecorator
  def arange_user
    self.users.pluck(:name).join(",")
  end

  def show_last_messages
      if self.messages.present?
        return self.messages.last.body
      else
        return 'まだメッセージがありません'
      end
  end
end
