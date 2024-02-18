require 'rails_helper'

RSpec.describe StatisticsController, type: :controller do
  let(:stub_file) do
    instance_double(ActionDispatch::Http::UploadedFile,
                    original_filename: 'Живаика Продажи.xlsx')
  end

  describe 'GET #index' do
    it 'show start page' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'OST #create' do
    before { allow(FileService::SourceFile).to receive(:call) }

    it 'how index page' do
      post :create, params: { source_file: stub_file }
      expect(response).to render_template :index
    end

    context 'get file' do
      it 'call SourceFile service' do
        expect(FileService::SourceFile).to receive(:call)
        post :create, params: { source_file: stub_file }
      end
    end
  end
end
