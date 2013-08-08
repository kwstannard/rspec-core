module RSpec
  module Core
    class BacktraceCleaner

      DEFAULT_EXCLUSION_PATTERNS = [
        /\/lib\d*\/ruby\//,
        /org\/jruby\//,
        /bin\//,
        %r|/gems/|,
        /spec\/spec_helper\.rb/,
        /lib\/rspec\/(core|expectations|matchers|mocks)/
      ]

      attr_accessor :inclusion_patterns
      attr_accessor :exclusion_patterns

      def initialize(inclusion_patterns=nil, exclusion_patterns=DEFAULT_EXCLUSION_PATTERNS.dup)
        @exclusion_patterns = exclusion_patterns
        @inclusion_patterns = inclusion_patterns || (exclusion_patterns.any? {|p| p =~ Dir.getwd} ? [Regexp.new(Dir.getwd)] : [])
      end

      def exclude?(line)
        @exclusion_patterns.any? {|p| p =~ line} and @inclusion_patterns.none? {|p| p =~ line}
      end

      def full_backtrace=(full_backtrace)
        @exclusion_patterns = full_backtrace ? [] : DEFAULT_EXCLUSION_PATTERNS.dup
      end

      def full_backtrace?
        @exclusion_patterns.empty?
      end
    end
  end
end
