module Wrike
  class Client

    # Get attachment list for tasks
    def attachment_list(task_ids=[], options={})
      post('wrike.attachment.list', options.merge(:taskIds => task_ids.join(',')))
    end
    
    # Upload attachment for specified task
    def attachment_upload(id, stream, options={})
      body, headers = http_multipart_data({:id => id, :stream => stream})
      post("wrike.attachment.upload", body, headers)
    end

    # Get file binary stream
    def attachment_download(id, options={})
      post("wrike.attachment.download", options.merge(:id => id))
    end

    # Get attachment history
    def attachment_history(id, options={})
      post("wrike.attachment.history", options.merge(:id => id))
    end

  end
end
