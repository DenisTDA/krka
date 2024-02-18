require "rails_helper"

RSpec.describe FileService::SourceFile do
  let(:source_file) do
    instance_double(
      ActionDispatch::Http::UploadedFile,
      original_filename: file_name,
    )
  end
  let(:params) { instance_double("params") }

  before do
    allow(params).to receive(:tempfile).and_return(source_file)
  end

  describe ".call" do
    context "file have correct name" do
      before do
        allow(RubyXL::Parser).to receive(:parse).and_return([1])
      end

      it "name of Givika, call service" do
        allow(source_file).to receive(:original_filename)
          .and_return("Живика квартальный отчет.xlsx")
        allow(Parsers::Givika).to receive(:call)

        expect(Parsers::Givika).to receive(:call)
        described_class.call(params)
      end

      it "name of Farmland, call service" do
        allow(source_file).to receive(:original_filename)
          .and_return("Продажи-04.xlsx")
        allow(Parsers::Farmland).to receive(:call)

        expect(Parsers::Farmland).to receive(:call)
        described_class.call(params)
      end
    end

    context "file have't correct name" do
      it "don't call Givika service" do
        allow(Parsers::Givika).to receive(:call)
        expect(Parsers::Givika).not_to receive(:call)
        described_class.call(params)
      end

      it "don't call Farmland service" do
        allow(Parsers::Farmland).to receive(:call)
        expect(Parsers::Farmland).not_to receive(:call)
        described_class.call(params)
      end
    end
  end

  def file_name
    Faker::Config.locale = :ru
    Faker::File.file_name(ext: "xlsx")
  end
end
