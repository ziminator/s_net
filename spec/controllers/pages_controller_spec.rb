require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    let(:pages) { [FactoryBot.create(:page)] }

    it 'returns all pages' do
      get :index

      expect(response).to render_template('index')
      expect(response).to have_http_status(:ok)
      expect(assigns(:pages)).to eq(pages)
    end
  end

  describe 'GET #show' do
    let(:page) { FactoryBot.create(:page) }

    it 'assigns page' do
      get :show, params: { id: page.id }

      expect(response).to render_template('show')
      expect(response).to have_http_status(:ok)
      expect(assigns(:page)).to eq(page)
    end
  end

  describe 'GET #new' do
    it 'returns render form for creating new page' do
      get :new

      expect(response).to render_template('new')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:page_params) { FactoryBot.attributes_for(:page) }

    it 'creates new page' do
      post :create, params: { page: page_params }

      expect(response).to redirect_to('/pages')
      expect(response).to have_http_status(:found)
    end

    it 'doesn`t create new page' do
      post :create, params: { page: page_params.except(:title) }

      expect(response).to render_template('new')
    end
  end

  describe 'PUT #update' do
    let(:page) { FactoryBot.create(:page) }

    it 'updates the requested page' do
      put :update, params: { id: page.id, page: { title: 'brbrbr' } }

      expect(response).to redirect_to("/pages/#{page.id}")
      expect(response).to have_http_status(:found)
    end

    it 'doesn`t update page' do
      put :update, params: { id: page.id, page: { title: '' } }

      expect(response).to render_template('edit')
    end
  end

  describe 'DELETE #destroy' do
    let(:page) { FactoryBot.create(:page) }

    it 'destroys page' do
      delete :destroy, params: { id: page.id }

      expect(response).to redirect_to('/pages')
    end
  end
end
