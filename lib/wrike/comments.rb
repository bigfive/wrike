module Wrike
  class Client

    # Returns list of comments
    def comment_list(task_id, options={})
      post('wrike.comment.list', options.merge(:taskId => task_id))
    end

    # Get new, updated, deleted comments lists since tLast
    def comment_updates(last, options={})
      post("wrike.comment.updates", options.merge(:tLast => last))
    end

    # Add a new comment to a task
    def comment_add(task_id, text, options={})
      post("wrike.comment.add", options.merge(:taskId => task_id, :text => text))
    end

    # Delete a comment and comment attachments
    def comment_delete(ids=[], options={})
      post("wrike.comment.delete", options.merge(:ids => ids.join(',')))
    end

    # Update a comment
    def comment_update(id, text, options={})
      post("wrike.comment.update", options.merge(:id => id, :text => text))
    end

  end
end
