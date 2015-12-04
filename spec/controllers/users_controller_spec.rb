require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it_behaves_like "a medium controller" do

    let(:create_params) do {
      user: {
        name: "User Name",
      }
    }
    end
  end
end
