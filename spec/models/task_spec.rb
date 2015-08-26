require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
  it { is_expected.to validate_presence_of(:title) }

  it { is_expected.to have_db_column(:project_id).of_type(:integer).with_options(null: false) }
  it { is_expected.to validate_presence_of(:project_id) }

  it { is_expected.to have_db_column(:comment).of_type(:string) }

  it { is_expected.to have_db_column(:complete).of_type(:boolean).with_options(null: false, default: false) }

  it { is_expected.to have_db_column(:priority).of_type(:integer).with_options(null: false, default: 0) }
end
