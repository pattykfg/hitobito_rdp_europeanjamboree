class Person::PrintController < ApplicationController
  before_action :authorize_action


  def index 
    @group ||= Group.find(params[:group_id])
    @person ||= group.people.find(params[:id])
  end

  def preview
    pdf = RdpEuropeanjamboree::Export::Pdf::Registration.render(@person,true)

    send_data pdf, type: :pdf, disposition: 'inline', filename: "Anmeldung-EJ-Vorschau.pdf"
  end


  # def submit
  #   pdf = RdpEuropeanjamboree::Export::Pdf::Registration.render(@person,false)

  #   send_data pdf, type: :pdf, disposition: 'inline', filename: "Anmeldung-EJ-" + person.id.to_s + ".pdf"
  # end

  private

  def entry
    @person ||= Person.find(params[:id])
  end

  def authorize_action
    authorize!(:edit, entry)
  end
end

class Participation
  def initialize(person)
      @person = person
  end

  def person
    @person
  end
end
  