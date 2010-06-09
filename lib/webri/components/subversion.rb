require 'webri/components/abstract'


module WebRI

  #
  class Subversion < Component

    #

    def path
      @path ||= Pathname.new(__FILE__).parent
    end

    #

    def initialize_methods
      provision :svninfo
    end

    #
    def svninfo(klass)
      @svninfo ||= {}
      @svninfo[klass] ||= get_svninfo(klass)
    end

    # Try to extract Subversion information out of the first constant whose value looks like
    # a subversion Id tag. If no matching constant is found, and empty hash is returned.
    def get_svninfo(klass)
      constants = klass.constants or return {}

      constants.find {|c| c.value =~ SVNID_PATTERN } or return {}

      filename, rev, date, time, committer = $~.captures
      commitdate = Time.parse( date + ' ' + time )

      return {
        :filename    => filename,
        :rev         => Integer( rev ),
        :commitdate  => commitdate,
        :commitdelta => (Time.now.to_i - commitdate.to_i).time_delta_string,
        :committer   => committer,
      }
    end

    # Example of output.
    def svninfo_html(klass)
      return '' if svninfo(klass).empty?
      <<-HERE
        <div id="file-svninfo-section" class="section">
          <h3 class="section-header">Subversion Info</h3>
          <div class="section-body">
            <dl class="svninfo">
              <dt>Rev</dt>
              <dd>#{svninfo(klass)[:rev]}</dd>

              <dt>Last Checked In</dt>
              <dd>#{svninfo(klass)[:commitdate].strftime('%Y-%m-%d %H:%M:%S')}
                (#{svninfo(klass)[:commitdelta]} ago)</dd>

              <dt>Checked in by</dt>
              <dd>#{svninfo(klass)[:committer]}</dd>
            </dl>
          </div>
        </div>
      HERE
    end

    # Subversion rev
    #SVNRev = %$Rev: 52 $

    # Subversion ID
    #SVNId = %$Id: darkfish.rb 52 2009-01-07 02:08:11Z deveiant $

    #
    SVNID_PATTERN = /
      \$Id:\s
        (\S+)\s          # filename
        (\d+)\s          # rev
        (\d{4}-\d{2}-\d{2})\s  # Date (YYYY-MM-DD)
        (\d{2}:\d{2}:\d{2}Z)\s  # Time (HH:MM:SSZ)
        (\w+)\s           # committer
      \$$
    /x

  end

end
