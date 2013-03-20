module Wrike
  class Client

    # Returns list of contacts
    def contacts_list
      post('wrike.contacts.list')
    end

  end
end
