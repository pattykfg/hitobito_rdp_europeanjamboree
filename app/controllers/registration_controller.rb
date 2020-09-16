# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

class RegistrationController < ActionController::Base
  layout 'application'
  helper_method :current_user, :origin_user

  def index
    @possible_types = Settings.person.type
    @registration_end_date =  Settings.date.registration_end
    if current_user
      @registration_online = ((Date.today < @registration_end_date))
    elsif
      @registration_online = (Date.today < @registration_end_date)
    end

    @possible_roles = "" 
    Settings.person.role.each { |role|
        @possible_roles += "<option id='" + role[0].to_s + "'>" + role[1].to_s + "</option>"
    }  

    if request.post? && @registration_online
      if params[:firstname].length < 2
         flash[:alert] = I18n.translate('activerecord.failure.first_name')
      elsif params[:name].length < 2
       flash[:alert] = I18n.translate('activerecord.failure.last_name') 
      elsif  not Truemail.valid?(params[:mail])
        flash[:alert] = I18n.translate('activerecord.failure.email') 
      elsif  Person.find_by_email(params[:mail])
        flash[:alert] = I18n.translate('activerecord.failure.email_exists') 
      else

        registerPerson = RegisterPerson.new
        group = Group.find_by_name(Settings.group.registration)
 
        #TODO role Mappen und Registrieren
        case params[:type]
        when "Teilnehmer"
          role = Group::Unassigned::UnitMember
        when "Unit Leitung"
          role = Group::Unassigned::UnitHead
        when "IST"
          role = Group::Unassigned::Ist
        when "Kontingentsteam"
          role = Group::Unassigned::Cmt 
        else
          role = Group::Unassigned::Member
        end   
        
        person = registerPerson.seed_person(params[:mail],params[:firstname], params[:name], group, role)

        WelcomeMailer.welcome_email(person).deliver_now
        flash[:notice] = "Eine Mail mit deinen Login Daten wurde an " + params[:mail] + " versandt!"
      end
    end


  end

  private

  def current_user
    nil
  end

  def origin_user
    nil
  end
end
