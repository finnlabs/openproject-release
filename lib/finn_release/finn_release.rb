module FinnRelease
  module FinnRelease
    def self.version
      @version ||= 
        begin
          read_file('../../../RELEASE_VERSION')
        rescue
          nil
        end
    end
    
    def self.release_date
      @date ||=
        begin
          read_file('../../../RELEASE_DATE').to_date
        rescue
          nil
        end
    end
    
    private
    def self.read_file( filename )
      File.read( File.expand_path(File.dirname(__FILE__) + filename ) )
    end
  end
end