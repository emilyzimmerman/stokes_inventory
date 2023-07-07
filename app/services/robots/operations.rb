module Robots
    module Operations
        def self.new_robot(params, current_user)
            robot = current_user.robots.new(name: params[:name])

            return ServiceContract.success(robot) if robot.save

            ServiceContract.error(robot.errors.full_messages)
        end
    end
end