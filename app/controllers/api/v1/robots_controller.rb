module Api
    module V1
        class RobotsController < Api::V1::ApplicationController
            def create
                result = Robots::Operations.new_robot(params, @current_user)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    robot: RobotBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload )
            end
        end
    end
end