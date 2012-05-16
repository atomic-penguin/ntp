require 'minitest/autorun'
require 'chef/node'
require 'chef/platform'

describe 'User::Attributes::Default' do
  let(:attr_ns) { 'ntp' }

  before do
    @node = Chef::Node.new
    @node.consume_external_attrs(ohai_data, {})
    @node.from_file(File.join(File.dirname(__FILE__), %w{.. .. attributes default.rb}))
  end

  let(:ohai_data) do
    { :platform => "default_os", :platform_version => '1.23' }
  end

  describe "for unknown platform" do
    it "sets the service name to ntp" do
      @node[attr_ns]['service'].must_equal "ntp"
    end
  end
end
