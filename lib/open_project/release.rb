module OpenProject
  module Release
    require 'open_project/release/engine'

    def self.version
      begin
        @version ||= File.read("#{Rails.root.join('config').to_s}/RELEASE_VERSION")
      rescue
        "no release version"
      end
    end

    def self.release_date
      @date ||= begin
        s = File.read("#{Rails.root.join('config').to_s}/RELEASE_DATE")
        Date.parse(s) if s
      rescue
        "no release date"
      end
    end

    def self.release_time
      @time ||= begin
        s = File.read("#{Rails.root.join('config').to_s}/RELEASE_DATE")
        Time.parse(s) if s
      rescue
        "no release time"
      end
    end

    private
    def self.read_file( filename )
      File.read( File.expand_path(File.dirname(__FILE__) + filename ) ) rescue nil
    end
  end
end
