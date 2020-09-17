# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.


module HitobitoRdpEuropeanjamboree
  class Wagon < Rails::Engine
    include Wagons::Wagon

    # Set the required application version.
    app_requirement '>= 0'

    # Add a load path for this specific wagon
    config.autoload_paths += %W( #{config.root}/app/abilities
                                 #{config.root}/app/domain
                                 #{config.root}/app/jobs
                               )

    config.to_prepare do
      # rubocop:disable SingleSpaceBeforeFirstArg
      # extend application classes here
      Group.send :include, RdpEuropeanjamboree::Group
      Person.send :include, RdpEuropeanjamboree::Person
      PeopleController.send :include, RdpEuropeanjamboree::PeopleController
      # TODO if Export is needed Export::Tabular::People::PeopleAddress.send :include, RdpEuropeanjamboree::Export::Tabular::People::PeopleAddress
      PersonSerializer.send :include, RdpEuropeanjamboree::PersonSerializer
      # rubocop:enable SingleSpaceBeforeFirstArg
    end

    initializer 'rdp_europeanjamboree.add_settings' do |_app|
      Settings.add_source!(File.join(paths['config'].existent, 'settings.yml'))
      Settings.reload!
    end

    initializer 'rdp_europeanjamboree.add_inflections' do |_app|
      ActiveSupport::Inflector.inflections do |inflect|
        # inflect.irregular 'census', 'censuses'
      end
    end


    private

    def seed_fixtures
      fixtures = root.join('db', 'seeds')
      ENV['NO_ENV'] ? [fixtures] : [fixtures, File.join(fixtures, Rails.env)]
    end

  end
end
