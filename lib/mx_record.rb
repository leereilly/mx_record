require 'resolv'

module MXRecord
  def self.get_server(domain)
    mx = nil
    Resolv::DNS.open do |dns|
      mail_servers = dns.getresources(domain, Resolv::DNS::Resource::IN::MX)
      return nil unless mail_servers and not mail_servers.empty?
      highest_priority = mail_servers.first
      mail_servers.each do |server|
        highest_priority = server if server.preference < highest_priority.preference
      end
      mx = highest_priority.exchange.to_s
    end
    return mx
  end
end