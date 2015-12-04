include Rails.application.routes.url_helpers

RSpec.shared_examples "a medium controller" do

end

  # describe "GET 'new'" do
  #   it "renders new view" do
  #     get :new
  #     expect(subject).to render_template :new
  #   end
  # end
  #
  # describe "GET 'edit'" do
  #   it "renders edit view" do
  #     get :edit, id: media.id
  #     expect(subject).to render_template :edit
  #   end
  # end
  #
  # describe "GET 'show'" do
  #   it "renders show view" do
  #     get :show, id: media.id
  #     expect(subject).to render_template :show
  #   end
  # end
  #
  # describe "POST 'create'" do
  #
  #   it "redirects to the show page" do
  #     post :create, create_params
  #     expect(subject).to redirect_to show_path_1
  #
  #   end
  #
  #   it "renders the new template on error" do
  #     post :create, bad_params
  #     expect(subject).to render_template :new
  #   end
  # end
  #
  # describe "PATCH 'update'" do
  #
  #   it "should be successful" do
  #     case media.class.to_s
  #       when "Book"
  #         patch :update, { id: media.id, book: update_params }
  #       when "Movie"
  #         patch :update, { id: media.id, movie: update_params }
  #       when "Album"
  #         patch :update, { id: media.id, album: update_params }
  #     end
  #     expect(subject).to redirect_to polymorphic_path(media)
  #   end
  #
  #   it "renders the new template on error" do
  #     case media.class.to_s
  #       when "Book"
  #         patch :update, { id: media.id, book: bad_update_params }
  #       when "Movie"
  #         patch :update, { id: media.id, movie: bad_update_params }
  #       when "Album"
  #         patch :update, { id: media.id, album: bad_update_params }
  #     end
  #     expect(subject).to render_template :new
  #   end
  # end
  #
  # describe "PATCH 'upvote'" do
  #   it "should be successful" do
  #     patch :upvote, { id: media.id }
  #     expect(subject).to redirect_to polymorphic_path(media)
  #   end
  # end
  #
  # describe "DELETE 'destroy'" do
  #   it "should be successful" do
  #     delete :destroy, { id: media.id }
  #     expect(subject).to redirect_to polymorphic_path(media.class)
  #   end
  # end
