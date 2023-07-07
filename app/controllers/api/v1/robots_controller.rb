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

            def index 
                robots = Robot.all 

                payload = {
                    robots: RobotBlueprint.render_as_hash(robots),
                    status: 201
                }
                render_success(payload: payload )
            end

            def show 
                robot = Robot.find(params[:id])

                payload = {
                    robot: RobotBlueprint.render_as_hash(robot),
                    status: 201
                }
                render_success(payload: payload )
            end

            def update 
                result = Robots::Operations.update_robot(params)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    robot: RobotBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload )
            end

            def destroy
                robot = Robot.find(params[:id])

                robot.destroy 
                render_success(payload: "Robot has been destroyed", status: 200 )

            end
        end
    end
end