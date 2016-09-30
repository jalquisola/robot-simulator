require "spec_helper"
require "robot"

describe Robot do
  let(:table) { Table.new(5,5) }
  let(:robot) { Robot.new(table) }

  context "when robot has not been placed" do

    describe "#forward" do
      it "does not move the robot" do
        robot.forward
        expect(robot.position).to be_nil
      end
    end

    describe "#left" do
      it "does not turn the robot" do
        robot.left
        expect(robot.direction).to be_nil
      end
    end

    describe "#right" do
      it "does not turn the robot" do
        expect(robot.direction).to be_nil
      end
    end
  end

  describe "#place" do
    context "when placing the robot on a valid location" do
      before do 
        robot.place(Position.new(4, 3), "EAST") 
      end

      it "sets the position" do
        expect(robot.position).to eq Position.new(4,3)
      end

      it "sets the direction" do
        expect(robot.direction).to eq "EAST"
      end

      it "marks the robot as placed" do
        expect(robot).to be_placed
      end
    end

    context "when placing the robot outside the table" do
      before do 
        robot.place(Position.new(6, 2), "WEST")
      end

      it "does not place the robot" do
        expect(robot).to_not be_placed
      end
    end
  end

  context "when robot has already been placed" do
    let(:direction) { "EAST" }

    before do
      robot.place(Position.new(2, 2), direction)
    end

    describe "#forward" do
      context "when the robot is facing NORTH" do
        let(:direction) { "NORTH" }

        it "moves the robot one step up" do
          robot.forward
          expect(robot.position).to eq Position.new(2,3)
        end
      end

      context "when the robot is facing EAST" do
        let(:direction) { "EAST" }

        it "moves the robot one step to the right" do
          robot.forward
          expect(robot.position).to eq Position.new(3,2)
        end
      end

      context "when the robot is facing SOUTH" do
        let(:direction) { "SOUTH" }

        it "moves the robot one step to the down" do
          robot.forward
          expect(robot.position).to eq Position.new(2,1)
        end
      end

      context "when the robot is facing WEST" do
        let(:direction) { "WEST" }

        it "moves the robot one step to the left" do
          robot.forward
          expect(robot.position).to eq Position.new(1,2)
        end
      end

      context "when the robot is on the rightmost edge of the table and facing WEST" do
        (0...5).each do |index|
          it "does not move the robot" do
            position = Position.new(0, index)
            robot.place(position, "WEST")
            robot.forward
            expect( robot.position ).to eq position
          end
        end
      end

      context "when the robot is on the leftmost edge of the table and facing EAST" do
        (0...5).each do |index|
          it "does not move the robot" do
            position = Position.new(4, index)
            robot.place(position, "EAST")
            robot.forward
            expect( robot.position ).to eq position
          end
        end
      end

      context "when the robot is on the uppermost edge of the table and facing NORTH" do
        (0...5).each do |index|
          it "does not move the robot" do
            position = Position.new(index, 4)
            robot.place(position, "NORTH")
            robot.forward
            expect( robot.position ).to eq position
          end
        end
      end

      context "when the robot is on the bottom edge of the table and facing SOUTH" do
        (0...5).each do |index|
          it "does not move the robot" do
            position = Position.new(index, 0)
            robot.place(position, "SOUTH")
            robot.forward
            expect( robot.position ).to eq position
          end
        end
      end
    end

    describe "#left" do
      it "turns the robot to the left" do
        robot.left
        expect(robot.direction).to eq "NORTH"
      end
    end

    describe "#right" do
      it "turns the robot to the right" do
        robot.right
        expect(robot.direction).to eq "SOUTH"
      end
    end

    describe "#turn" do
      it "turns the robot clockwise by the number of steps provided" do
        robot.turn(1)
        expect(robot.direction).to eq "SOUTH"
      end

      it "turns the robot counter-clockwise when a negative value is provided" do
        robot.turn(-1)
        expect(robot.direction).to eq "NORTH"
      end
    end

    describe "#location" do
      it "reports the robot position and direction" do
        expect(robot.location).to eq "2,2,EAST"
      end
    end
  end

end
