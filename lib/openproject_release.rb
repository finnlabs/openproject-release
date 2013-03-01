require 'openproject_release/engine'

module OpenprojectRelease
  module OpenprojectRelease
    def self.version
      @version ||= read_file('../../RELEASE_VERSION')
    end
    
    def self.release_date
      @date ||= begin
        s = read_file('../../RELEASE_DATE')
        Date.parse(s) if s
      end
    end

    def self.release_time
      @time ||= begin
        s = read_file('../../RELEASE_DATE')
        Time.parse(s) if s
      end
    end
    
    private
    def self.read_file( filename )
      File.read( File.expand_path(File.dirname(__FILE__) + filename ) ) rescue nil
    end
  end
end
