require 'rails_helper'

RSpec.describe TestsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/courses/1/tests/new')
        .to route_to('tests#new', course_id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/courses/1/tests/1/edit')
        .to route_to('tests#edit', id: '1', course_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/courses/1/tests')
        .to route_to('tests#create', course_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/courses/1/tests/1')
        .to route_to('tests#update', id: '1', course_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/courses/1/tests/1')
        .to route_to('tests#update', id: '1', course_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/courses/1/tests/1')
        .to route_to('tests#destroy', id: '1', course_id: '1')
    end
  end
end
