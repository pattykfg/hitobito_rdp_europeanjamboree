# encoding: utf-8

class RegistrationController < ActionController::Base
  layout 'application'
  helper_method :current_user, :origin_user

  #include RdpConditionsHelper

  def index
    @possible_types = Settings.person.type
    @registration_end_date =  Settings.date.registration_end
    if current_user
      @registration_online = ((Date.today < @registration_end_date))
    elsif
      @registration_online = (Date.today < @registration_end_date)
    end

    if request.post? && @registration_online
      if params[:firstname].length < 2
         flash[:alert] = "Bitte gib deinen vollständigen Vornamen ein."
      elsif params[:name].length < 2
        flash[:alert] = "Bitte gib deinen vollständigen Nachnamen ein."
      elsif  not Truemail.valid?(params[:mail])
        flash[:alert] = "Bitte gib deine Mailadresse ein."
      elsif  Person.find_by_email(params[:mail])
        flash[:alert] = "Es existiert schon ein Account mit dieser e-Mail Adresse. Du kannst dein Passwort über 'Passwort vergessen?' zurücksetzen."
      else

        registerPerson = RegisterPerson.new
        group = Group.find_by_name('Gruppe noch nicht zugewiesen')
        #TODO role Mappen und Registrieren
        role = Group::Unassigned::Member
        # person = registerPerson.seed_person(params[:mail],params[:firstname], params[:name], group, role)


        # WelcomeMailer.welcome_email(person).deliver_now
        # flash[:notice] = "Eine Mail mit deinen Login Daten wurde an " + params[:mail] + " versandt!"
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
