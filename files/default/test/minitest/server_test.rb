class TestNtp < MiniTest::Chef::TestCase
  def test_that_the_server_does_not_peer_itself
    assert ! node['ntp']['peers'].include?(node['ipaddress'])
    assert ! node['ntp']['peers'].include?(node['fqdn'])
  end

  def test_that_the_server_is_not_its_own_server
    assert ! node['ntp']['servers'].include?(node['ipaddress'])
    assert ! node['ntp']['servers'].include?(node['fqdn'])
  end
end
