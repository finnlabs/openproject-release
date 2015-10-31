module OpenProject
  module Release
    require 'open_project/release/engine'

    def self.version
      @version ||= File.read("#{Rails.root.join('config')}/RELEASE_VERSION")
    rescue
      @version = 'no release version'
    end

    def self.release_date
      @date ||= begin
        s = File.read("#{Rails.root.join('config')}/RELEASE_DATE")
        Date.parse(s) if s
      rescue
        @date = 'no release date'
      end
    end

    def self.release_time
      @time ||= begin
        s = File.read("#{Rails.root.join('config')}/RELEASE_DATE")
        Time.parse(s) if s
      rescue
        @date = 'no release time'
      end
    end

    # Used for testing
    def self.clear_cache
      @version = @date = @time = nil
    end
  end
end
