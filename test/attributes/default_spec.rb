require File.join(File.dirname(__FILE__), %w{.. spec_helper})
require 'chef/node'
require 'chef/platform'

describe 'Ntp::Attributes::Default' do
  let(:attr_ns) { 'ntp' }

  before do
    @node = Chef::Node.new
    @node.consume_external_attrs(Mash.new(ohai_data), {})
    @node.from_file(File.join(File.dirname(__FILE__), %w{.. .. attributes default.rb}))
  end

  describe "for unknown platform" do
    let(:ohai_data) do
      { :platform => "default_os", :platform_version => '1.23' }
    end

    it "sets the service name to ntp" do
      @node[attr_ns]['service'].must_equal "ntp"
    end
  end

  describe "for centos 5 platform" do
    let(:ohai_data) do
      { :platform => "centos", :platform_version => '5.7' }
    end

    it "sets the service name to ntp" do
      @node[attr_ns]['service'].must_equal "ntpd"
    end

    it "sets a packages list" do
      @node[attr_ns]['packages'].must_equal %w{ ntp }
    end
  end

  describe "for centos 6 platform" do
    let(:ohai_data) do
      { :platform => "centos", :platform_version => '6.2' }
    end

    it "sets the service name to ntp" do
      @node[attr_ns]['service'].must_equal "ntpd"
    end

    it "sets a packages list" do
      @node[attr_ns]['packages'].must_equal %w{ ntp ntpdate }
    end
  end
end
