# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.


if Rake::Task.task_defined?('spec:features')
  # we DO have feature specs in this wagon.
  Rake::Task['spec:features'].actions.clear
  namespace :spec do
    RSpec::Core::RakeTask.new(:features) do |t|
      t.pattern = './spec/features/**/*_spec.rb'
      t.rspec_opts = '--tag type:feature'
    end

    task all: ['spec:features', 'spec']
  end

else
  # we do NOT have feature specs in this wagon.
  namespace :spec do
    task all: 'spec'
  end
end
