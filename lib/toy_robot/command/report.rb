module Command
  class Report
    def perform(robot)
      puts robot.report
    end

    def recognize?(command_name)
      command_name == "REPORT"
    end

    def configure(_ = nil)
      self
    end
  end
end
