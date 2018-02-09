require 'rails_helper'

RSpec.describe AssistancesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/assistances').to route_to('assistances#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/assistances/1').to route_to('assistances#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/assistances/1').to route_to('assistances#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/assistances/1').to route_to('assistances#destroy', id: '1')
    end
  end
end
