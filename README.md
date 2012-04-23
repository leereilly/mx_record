# mx_record

> A mail exchanger record (MX record) is a type of resource record in the Domain Name System that specifies a mail server responsible for accepting email messages on behalf of a recipient's domain, and a preference value used to prioritize mail delivery if multiple mail servers are available. The set of MX records of a domain name specifies how email should be routed with the Simple Mail Transfer Protocol [[more](http://en.wikipedia.org/wiki/MX_record)].

# Usage

```ruby
MXRecord::get_server('google.com')
  #=> aspmx.l.google.com
    
    
```ruby
MXRecord::get_server('rangers.co.uk')
  #=> mail.rangers.co.uk
```

# Contributing to mx_record

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

# Copyright

Copyright (c) 2012 Lee Reilly. See LICENSE.txt for
further details.

