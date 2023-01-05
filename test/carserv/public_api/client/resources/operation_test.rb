# frozen_string_literal: true

require "test_helper"
describe Carserv::PublicApi::Client::Operation do
  describe "#list" do
    context "when the operation records not present" do
      it "should return empty list" do
        Operation.stub :list, [] do
          response = Operation.list
          assert_empty response
        end
      end
    end

    context "when the operation records present" do
      it "should return list of operation records" do
        operations = [{
          "type" => "operations",
          "id" => "5569972",
          "created_at" => "2021-11-30T09:10:22+00:00",
          "description" => "Test2",
          "motor_category_id" => nil,
          "motor_group_id" => nil,
          "motor_name" => nil,
          "motor_subgroup_id" => nil,
          "motor_taxonomy_id" => nil,
          "operation_category" => nil,
          "operation_code" => nil,
          "operation_id" => nil,
          "operation_name" => nil,
          "state" => "finalize",
          "updated_at" => "2021-11-30T09:10:49+00:00"
        }]

        Operation.stub :list, operations do
          options = { filter: { job_id: 143 } }
          response = Operation.list(options)
          assert_equal "operations", response.first["type"]
          assert_equal 1, response.length
        end
      end
    end
  end
end
