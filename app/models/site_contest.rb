class SiteContest < ApplicationRecord
  belongs_to :site
  belongs_to :contest
end
