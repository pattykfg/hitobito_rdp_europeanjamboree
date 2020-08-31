# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.

class Group::Root < ::Group

  self.layer = true

  children Group::UnitSupport
  children Group::Unassigned
  children Group::InternationalServiceTeam

  ### ROLES
  class Administrator < ::Role
    self.permissions = [:layer_and_below_full, :admin]
  end

  class Head < ::Role
    self.permissions = [:layer_and_below_full]
  end

  class Registration < ::Role
    self.permissions = [:layer_and_below_full]
  end
  
  class Finance < ::Role
    self.permissions = [:layer_and_below_full]
  end

  class Member < ::Role
    self.permissions = []
  end

  roles Administrator, Head, Registration, Finance
end
