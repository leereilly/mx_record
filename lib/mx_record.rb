require 'resolv'

module MXRecord

  # Obtain the mail exchange record for a particular domain.
  #
  # Returns an array of Resolv::DNS::Resource::IN::MX records e.g. for Google:
  #
  # [ #<Resolv::DNS::Resource::IN::MX:0x007faaac870da8 @preference=50, @exchange=#<Resolv::DNS::Name: alt4.aspmx.l.google.com.>, @ttl=347>,
  #   #<Resolv::DNS::Resource::IN::MX:0x007faaac8769b0 @preference=20, @exchange=#<Resolv::DNS::Name: alt1.aspmx.l.google.com.>, @ttl=347>,
  #   #<Resolv::DNS::Resource::IN::MX:0x007faaac874db8 @preference=40, @exchange=#<Resolv::DNS::Name: alt3.aspmx.l.google.com.>, @ttl=347>,
  #   #<Resolv::DNS::Resource::IN::MX:0x007faaac87abf0 @preference=30, @exchange=#<Resolv::DNS::Name: alt2.aspmx.l.google.com.>, @ttl=347>,
  #   #<Resolv::DNS::Resource::IN::MX:0x007faaac87f830 @preference=10, @exchange=#<Resolv::DNS::Name: aspmx.l.google.com.>, @ttl=347> ]
  def self.mail_servers(domain)
    Resolv::DNS.open do |dns|
      dns.getresources(domain, Resolv::DNS::Resource::IN::MX)
    end
  end

  # Obtain the preferred mail server based on the MX record's preference.
  #
  # Returns a String containing the mail server name e.g. aspmx.l.google.com;
  # returns nil if no servers are found.
  def self.primary_server(domain)
    servers = mail_servers(domain)

    primary_server = servers.first

    servers.each do |server|
      primary_server = server if server.preference < primary_server.preference
    end

    primary_server.exchange.to_s
  end
end