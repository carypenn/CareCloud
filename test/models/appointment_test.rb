require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
   test "creating_appointments" do
     d = {start_time: "2015-07-01 00:00:00", end_time: "2015-07-02 00:00:00", first_name: "cary", last_name: "penn" }
     appointment = Appointment.new(d)
     assert appointment.save
   end
   test "invalid_appointment" do
   	 d = {start_time: "2015-04-01 00:00:00", end_time: "2015-04-02 00:00:00", first_name: "cary", last_name: "penn" }
   	 d1 = {start_time: "2015-06-02 00:00:00", end_time: "2015-06-01 00:00:00", first_name: "cary", last_name: "penn" }
   	 appointment = Appointment.new(d)
   	 appointment1 = Appointment.new(d1)
   	 assert_not appointment.save, "appointment date is in the past"
   	 assert_not appointment1.save, "end time before start time"
   end
   test "overlapping_appointments" do
     d = {start_time: "2015-10-01 00:00:00", end_time: "2015-10-07 00:00:00", first_name: "cary", last_name: "penn" }
   	 d1 = {start_time: "2015-10-07 00:00:00", end_time: "2015-10-15 00:00:00", first_name: "cary", last_name: "penn" }
   	 d2 = {start_time: "2015-10-01 00:00:00", end_time: "2015-10-15 00:00:00", first_name: "cary", last_name: "penn" }
   	 d3 = {start_time: "2015-10-05 00:00:00", end_time: "2015-10-6 00:00:00", first_name: "cary", last_name: "penn" }
   	 appointment = Appointment.new(d)
   	 appointment1 = Appointment.new(d1)
   	 appointment2 = Appointment.new(d2)
   	 appointment3 = Appointment.new(d3)
   	 assert_not appointment.save, "Save Overlapping Appointment"
     assert_not appointment1.save, "Save Overlapping Appointment"
     assert_not appointment2.save, "Save Overlapping Appointment"
     assert_not appointment3.save, "Save Overlapping Appointment"
   end
end
