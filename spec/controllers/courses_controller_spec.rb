require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      course = Course.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      course = Course.create! valid_attributes
      get :show, params: { id: course.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      course = Course.create! valid_attributes
      get :edit, params: { id: course.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Course' do
        expect do
          post :create, params: { course: valid_attributes }, session: valid_session
        end.to change(Course, :count).by(1)
      end

      it 'redirects to the created course' do
        post :create, params: { course: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Course.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { course: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested course' do
        course = Course.create! valid_attributes
        put :update, params: { id: course.to_param, course: new_attributes }, session: valid_session
        course.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the course' do
        course = Course.create! valid_attributes
        put :update, params: { id: course.to_param, course: valid_attributes }, session: valid_session
        expect(response).to redirect_to(course)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        course = Course.create! valid_attributes
        put :update, params: { id: course.to_param, course: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested course' do
      course = Course.create! valid_attributes
      expect do
        delete :destroy, params: { id: course.to_param }, session: valid_session
      end.to change(Course, :count).by(-1)
    end

    it 'redirects to the courses list' do
      course = Course.create! valid_attributes
      delete :destroy, params: { id: course.to_param }, session: valid_session
      expect(response).to redirect_to(courses_url)
    end
  end
end
