# mastocheck - tool for listing verification links

## about
Verification of links on Mastodon profiles is self-serve, with no charges.
Mastodon instances check for `rel="me"` links on the pages you link from your profile.
If the linked pages link to your profile, you get a green check.

This isn't a one-time thing; as other instances become aware of your profile, they'll check later.

## install and run
```
git clone ...
bundle
bundle exec mastocheck.rb [url]
```

## resources
This was based on code from the Mastodon fork, [Hometown](https://github.com/hometown-fork/hometown/).
Specifically, the file [`/app/services/verify_link_service.rb`](https://github.com/hometown-fork/hometown/blob/hometown-dev/app/services/verify_link_service.rb).
This means this is derivative, and the license matches the above: AGPL 3.0.
