# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  user_id    :string(255)
#  reference  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  amount     :integer
#

Fabricator(:payment) do
  
  amount 999
  reference "dfsffsdfvdsaf"
  
  
end
