module Wrike
  class Client

    # Get a list of all active folders of the calling user
    def folder_tree(options={})
      #args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      post("wrike.folder.tree", options)
    end

    # Get folder data
    def folder_get(id, options={})
      post("wrike.folder.get", options.merge(:id => id))
    end

    # Add a new folder
    def folder_add(title, options={})
      post("wrike.folder.add", options.merge(:title => title))
    end

    # Delete folders and all descendants
    def folder_delete(ids=[], options={})
      post("wrike.folder.delete", options.merge(:ids => ids.join(',')))
    end

    # Update a folder
    def folder_update(id, title, options={})
      post("wrike.folder.update", options.merge(:id => id, :title => title))
    end

  end
end
