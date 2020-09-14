

class Person::ManagementController < ApplicationController
    before_action :authorize_action

    decorates :group, :person

    def index 
        @group ||= Group.find(params[:group_id])
        @person ||= group.people.find(params[:id])

        if (request.put?)
            @person.registration_locked = params["person"]["registration_locked"]
            @person.sepa_signature = params["person"]["sepa_signature"]
            @person.sepa_date = params["person"]["sepa_date"]
            @person.contract_signature = params["person"]["contract_signature"]
            @person.media_agreement = params["person"]["media_agreement"]
            @person.registration_accepted_date = params["person"]["registration_accepted_date"]
            @person.payment_problem = params["person"]["payment_problem"]
            @person.payment_recieved = params["person"]["payment_recieved"]
            @person.save
        end 
    end

    def edit 
        @person ||= group.people.find(params[:id])
    end

    private
    def entry
        @person ||= group.people.find(params[:id])
    end

    def group
        @group ||= Group.find(params[:group_id])
    end

    def authorize_action
        authorize!(:index_invoices, entry)
    end
end
  