require 'rails_helper'

RSpec.describe AssistancesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/courses/1/assistances').to route_to('assistances#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/courses/2/assistances/1').to route_to('assistances#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/courses/2/assistances/1').to route_to('assistances#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/courses/2/assistances/1').to route_to('assistances#destroy', id: '1')
    end
  end
end
