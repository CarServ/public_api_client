# frozen_string_literal: true

require "test_helper"
describe Carserv::PublicApi::Client::ServiceAdvisor do
  describe "#fetch" do
    context "when the service_advisor record is not present" do
      it "should return nil" do
        assert_nil ServiceAdvisor.fetch(id: 900)
      end
    end

    context "when the service_advisor record is present" do
      it "should return valid ServiceAdvisor" do
        service_advisor_record = ServiceAdvisor.new
        service_advisor_record.attributes = {
          "type" => "service_advisors",
          "id" => "1665",
          "active" => true,
          "created_at" => "2020-05-28T16:34:49+00:00",
          "employee_id" => "522149",
          "first_name" => "Anthony",
          "hourly_rate" => 12.87,
          "last_name" => "Buckley",
          "name" => "Anthony Buckley",
          "updated_at" => "2021-02-11T01:13:47+00:00"
        }

        ServiceAdvisor.stub :fetch, service_advisor_record do
          service_advisor = ServiceAdvisor.fetch("1665")
          assert_kind_of ServiceAdvisor, service_advisor
          assert_equal "1665", service_advisor.id
        end
      end
    end
  end

  describe "#list" do
    context "when the service_advisor records not present" do
      it "should return empty list" do
        ServiceAdvisor.stub :list, [] do
          response = ServiceAdvisor.list
          assert_empty response
        end
      end
    end

    context "when the service_advisor records present" do
      it "should return list of service_advisor records" do
        service_advisors = [{
          "type" => "service_advisors",
          "id" => "1665",
          "active" => true,
          "created_at" => "2020-05-28T16:34:49+00:00",
          "employee_id" => "522149",
          "first_name" => "Anthony",
          "hourly_rate" => 12.87,
          "last_name" => "Buckley",
          "name" => "Anthony Buckley",
          "updated_at" => "2021-02-11T01:13:47+00:00"
        }]

        ServiceAdvisor.stub :list, service_advisors do
          response = ServiceAdvisor.list
          assert_equal "service_advisors", response.first["type"]
          assert_equal 1, response.length
        end
      end
    end
  end
end
