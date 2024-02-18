module FileService
  ##
  # Получает файл, определяет какой парсер вызывать
  class SourceFile < ApplicationService
    attr_reader :source_file

    def initialize(params)
      @source_file = params.tempfile
    end

    def call
      name_file = source_file.original_filename
      return if bad_name?(name_file)

      data_from_file(source_file)
    end

    private

    def data_from_file(file)
      sheet = RubyXL::Parser.parse(file)[0]
      file.original_filename.include?("Живика") ? Parsers::Givika.call(sheet) : Parsers::Farmland.call(sheet)
    end

    def bad_name?(name_file)
      return false if name_file.include?("Живика")
      return false if name_file.include?("Продажи")

      true
    end
  end
end
