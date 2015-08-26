require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
  it { is_expected.to validate_presence_of(:title) }

  it { is_expected.to have_many(:tasks).dependent(:destroy) }
end
