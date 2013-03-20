module Wrike
  class Client

    # Get a time log for a task
    def timelog_list(task_id, options={})
      post('wrike.timelog.list', options.merge(:taskId => task_id))
    end

    # Get time logs by filter
    def timelog_filter(options={})
      post("wrike.timelog.filter", options)
    end

    # Add a new time log to a task
    def timelog_add(date, task_id, hours, comment='', options={})
      post("wrike.timelog.add", options.merge(:date => date, :taskId => task_id, :hours => hours, :comment => comment))
    end

    # Delete a time log from a task
    def timelog_delete(ids=[], options={})
      post("wrike.timelog.delete", options.merge(:ids => ids.join(',')))
    end

  end
end
