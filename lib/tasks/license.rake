# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.


namespace :app do
  namespace :license do
    task :config do
      @licenser = Licenser.new('hitobito_rdp_europeanjamboree',
                               'European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.',
                               'https://github.com/smeky42/hitobito_rdp_europeanjamboree')
    end
  end
end