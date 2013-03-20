module Wrike
  class Client

    # Get task data
    def task_get(id, options={})
      post("wrike.task.get", options.merge(:id => id))
    end

    # Get tasks by filter or template
    def task_filter(options={})
      post("wrike.task.filter", options)
    end

    # Get task updates by since last tLast
    def task_updates(last, options={})
      post("wrike.task.updates", options.merge(:tLast => last))
    end

    # Add a new task
    def task_add(title, options={})
      post("wrike.task.add", options.merge(:title => title))
    end

    # Delete an existing task
    def task_delete(ids=[], options={})
      post("wrike.task.delete", options.merge(:ids => ids.join(',')))
    end

    # Update a task
    def task_update(id, title, options={})
      post("wrike.task.update", options.merge(:id => id, :title => title))
    end

  end
end
