require 'rails_helper'

RSpec.describe EnrollmentsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/courses/1/enrollments/new').to route_to('enrollments#new', course_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/courses/1/enrollments').to route_to('enrollments#create', course_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/courses/1/enrollments/1').to route_to('enrollments#destroy', id: '1', course_id: '1')
    end
  end
end
